

           ####################################################################
           #                                                                  #
           # DataObjects::Schema::                                            #
           #                      Database                                    #
           #                      Table                                       #
           #                                                                  #
           #                      Column::                                    #
           #                              String  < Column                    #
           #                              Numeric < Column                    #
           #                              Integer < Numeric                   #
           #                              Float   < Numeric                   #
           #                              Decimal < Numeric                   #
           #                              ...                                 #
           #                                                                  #
           #                      Index                                       #
           #                      UniqueIndex < Index                         #
           #                      PrimaryKey  < UniqueIndex                   #
           #                      ForeignKey                                  #
           #                      Reference                                   #
           #                                                                  #
           #                      OrderedSet                                  #
           #                      Columns       (has-a OrderedSet)            #
           #                      Indexes       (has-a OrderedSet)            #
           #                      UniqueIndexes (has-a OrderedSet)            #
           #                      ForeignKeys   (has-a OrderedSet)            #
           #                                                                  #
           #                                                                  #
           # ---------------------------------------------------------------  #
           #                             NOTES                                #
           # ---------------------------------------------------------------  #
           #                                                                  #
           # Table, Index, UniqueIndex, PrimaryKey, ForeignKey and Reference  #
           # are Enumerable, and delegate #each to #columns                   #
           #                                                                  #
           ####################################################################




##############################################################################################
#                                                                                            #
#                             Database introspection API                                     #
#                                                                                            #
##############################################################################################


uri = Addressable::URI.parse('mysql://localhost/dm_core_test')

database = DataObjects::Schema.load(uri)

database.name                  # => "dm_core_test"
database.uri                   # => uri
database.tables                # => Tables.new([ Table ])
database.tables[:table_name]   # => Table.new('table_name', ...)
database.method_missing        # delegates to #tables[]

database.tables.each do |table|

  # Table API
  table                        # => Table.new('customers', [ Column ], :indexes => indexes)
  table.name                   # => "customers"


  # Column API
  table.columns                # => Columns.new([ Column ])

  table.each do |column|

    column                     # => Column::String.new('name', :length => 0..10)
    column.name                # => "name"
    column.required?           # => true
    column.default             # => "a"

    # NOTE
    # --------------------------------------------------------------
    # Column subclasses will be able to add extra accessors for type
    # specific data. For example Column::String may define #length,
    # and Column::Decimal may define #precision and #scale
    # --------------------------------------------------------------

  end

  # Primary Key API
  table.primary_key            # => PrimaryKey.new(name, [ Column ])
  table.primary_key.columns    # => Columns.new([ Column ])
  table.primary_key.unique?    # => true


  # Foreign Key API
  table.foreign_keys           # => ForeignKeys.new([ ForeignKey ])

  table.foreign_keys.each do |foreign_key|

    foreign_key                # => ForeignKey.new('name', [ Column ], reference, :on_delete => :restrict, :on_update => :restrict)
    foreign_key.name           # => "foreign_key_name"
    foreign_key.columns        # => Columns.new([ Column ])
    foreign_key.reference      # => Reference.new(other_table, other_table.primary_key)
    foreign_key.on_delete      # => :restrict
    foreign_key.on_update      # => :restrict

  end

  # Check constraint API
  table.check_constraints
  table.check_constraints['constraint_name'] # => Constraint::Check

  # Index API
  table.indexes                # => Indexes.new([ Index ])

  table.indexes.each do |index|

    index                      # => Index.new('name', [ Column ])
    index.name                 # => 'name'
    index.unique?              # => false
    index.columns              # => Columns.new([ Column ])

  end

  # Unique Index API
  table.unique_indexes         # => UniqueIndexes.new([ UniqueIndex ])

  table.unique_indexes.each do |unique_index|

    unique_index               # => UniqueIndex.new('name', [ Column ])
    unique_index.name          # => 'name'
    unique_index.unique?       # => true
    unique_index.columns       # => Columns.new([ Column ])

  end


end


##############################################################################################
#                                                                                            #
#                              Database manipulation API                                     #
#                                                                                            #
##############################################################################################


DataObjects::Schema.create_database(uri)

DataObjects::Schema.drop_database(uri)


DataObjects::Schema.database

DataObjects::Schema.database(uri) do

  uri           # => Addressable::URI        => the current database uri

  db            # => Database.new(uri)       => the current database
  db(uri)       # => Database.new(uri)       => the current database
  db(other_uri) # => Database.new(other_uri) => the database located at other_uri


  execute 'statement'

  execute [ 'statement', bind, variables ]


  select 'query'

  select [ 'query', bind, variables ]


  create_table :people do

    column :id,    Auto,    :key      => true
    column :name,  String,  :required => true, :default => 'foo'
    column :age,   Integer, :required => true, :check   => 'age > 16' # constraint name => 'age_check'
    column :token, String,  :required => true

    # Add an index. Complains if an index with that name is already present
    index :name_index, :name

    # Add a unique constraint. Complains if a constraint with that name is already present
    unique :unique_token, :token

    # Bad example that illustrates how to add a check constraint for
    # which the condition depends on the values of multiple columns
    check :token_check, "token LIKE name"

  end

  create_table :tasks do

    column :id,   Auto,   :key      => true
    column :name, String, :required => true

    # Add a unique index. Complains if an index with that name is already present
    unique :unique_name, :name

  end

  create_table :people_tasks do

    column :id,        Auto,    :key    => true
    column :person_id, Integer, :unique => true # part of Constraint::Unique.new('unique_person_id_task_id'
    column :task_id,   Integer, :unique => true # part of Constraint::Unique.new('unique_person_id_task_id'

    # The multiple :unique => true declarations above are one way
    # to construct a unique constraint spanning multiple columns.
    # However, there's no control over the generated constraint name.
    # The algorithm for constructing the constraint name just prepends
    # the alphabetically sorted column names to the 'unique_' string,
    # separating each column name with a '_'
    #
    # There's another way to declare a unique constraint spanning multiple
    # columns, that also allows you to specify an arbitrary constraint name
    #
    #   unique :unique_person_tasks, [ :person_id, :task_id ]
    #
    # establishes a unique constraint for the same two columns, this time
    # naming it explicitly as :unique_person_tasks

  end

  create_table :jobs do

    column :id,   Auto,   :key      => true
    column :name, String, :required => true, :unique => true # constraint name => 'unique_name'

  end

  create_table :people_jobs do

    # The :key and :references options provide shortcuts to the explicit
    # declarations of primary and foreign keys as seen below.
    #
    # NOTE
    # Foreign keys referencing more than one column, need to be declared
    # using the explicit syntax shown in the definition of the :workloads
    # table below.

    column :person_id, String  #, :key => true, :references => people.id, :on_update => :restrict, :on_delete => :restrict
    column :job_id,    Integer #, :key => true, :references => jobs.id,   :on_update => :restrict, :on_delete => :restrict

    # Defining a composite primary key
    primary_key [ :person_id, :job_id ]

    # Defining a foreign key with a single column can be done without passing
    # a block to the #foreign_key method. The 2nd parameter must be a symbol
    # denoting a column that actually exists in the current database (db)
    #
    # When defining the referenced column, we can rely on #method_missing
    # functionality to recognize any table name inside the current database.
    # We can also pass the database containing the referenced table explicitly
    #
    # Customizing the foreign key is possible either by passing arguments or a block

    # Argument API
    foreign_key :person_fk, :person_id, :references => people.id #, :on_update => :restrict, :on_delete => :restrict
    foreign_key :job_fk,    :job_id,    :references => jobs.id   #, :on_update => :restrict, :on_delete => :restrict

    # Block API
    foreign_key :person_fk do
      column :person_id, :references => people.id
      # on_update :restrict
      # on_delete :restrict
    end

    foreign_key :job_fk do
      column :job_id, :references => jobs.id
      # on_update :restrict
      # on_delete :restrict
    end

  end

  create_table :workloads do

    # The [ :id, :person_id, :task_id ] columns
    # form the composite primary key of this table.

    column :id,          Auto,    :key => true
    column :person_id,   String,  :key => true
    column :task_id,     Integer, :key => true
    column :description, Text

    # Provide the information needed by passing a block to #foreign_key
    foreign_key :people_tasks_fk do
      column :person_id, :references => people.id
      column :tasks_id,  :references => tasks.id
      # on_update :restrict
      # on_delete :restrict
    end

  end

  alter_table :people do

    # Adds a column. Complains if that column already exists
    add_column :hobby, String, :required => false, :default => 'Programming', :check => "hobby LIKE 'Programming'"

  end

  alter_table :people do

    # Modifies an existing column.
    #
    # The resulting column will have exactly the options specified.
    # Previously established options that are not specified during
    # a call to #modify_column will be reset (to their default values)
    #
    # Complains if that column doesn't yet exist
    modify_column :hobby, String, :required => true,  :default => 'Party', :check => "hobby LIKE 'Party'"

  end

  alter_table :people do

    # Renames a column.
    #
    # Complains if the column to rename doesn't yet exist
    # Complains if the new column name is already taken
    #
    rename_column :hobby, :to => :work

  end

  alter_table :people do

    # Adds a foreign key.
    #
    # Complains if any constraint with the given name already exists
    add_foreign_key :work_fk, :work, :references => jobs.name, :on_update => :restrict, :on_delete => :restrict

    # Drops a foreign key. Complains if that foreign key doesn't exist yet
    drop_foreign_key :work_fk

  end

  alter_table :people do

    # Drops a column. Complains if that column doesn't yet exist
    drop_column :hobby

  end

  alter_table :workloads do

    # Drops a foreign key. Complains if that foreign key doesn't exist yet
    drop_foreign_key :people_tasks_fk

    # Add a foreign key constraint targetting multiple columns.
    #
    # Complains if that foreign key already exists
    # Complains if any of the columns isn't present in the table
    #
    add_foreign_key :people_tasks_fk do
      column :person_id, :references => people.id
      column :tasks_id,  :references => tasks.id
      # on_update :restrict
      # on_delete :restrict
    end

  end

  alter_table :people do

    # Add a foreign key constraint that references a column in a different database
    #
    # Referencing tables from a different database means that we can't rely on
    # #method_missing functionality to lookup available table names. We must specify
    # the database containing the referenced table explicitly

    # Argument API
    add_foreign_key :people_name_fk, :name, :references => db(user_db_uri).users.name, :on_update => :restrict, :on_delete => :restrict

    # Drops a foreign key. Complains if that foreign key doesn't exist yet
    drop_foreign_key :people_name_fk

    # Block API
    add_foreign_key :people_name_fk do
      column :name, :references => db(user_db_uri).users.name
      # on_update :restrict
      # on_delete :restrict
    end

    # Drops any constraint identified by the given name. Complains if
    # that constraint doesn't yet exist.
    drop_constraint :people_name_fk

  end

  drop_table :people
  drop_table :tasks
  drop_table :jobs
  drop_table :people_tasks
  drop_table :workloads

end

