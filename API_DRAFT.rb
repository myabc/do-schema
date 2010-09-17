# ----------------------------------------------------------------
#
# DataObjects::Schema::
#                      Database
#                      Table
#
#                      Column::
#                              String  < Column
#                              Numeric < Column
#                              Integer < Numeric
#                              Float   < Numeric
#                              Decimal < Numeric
#                              ...
#
#                      Index
#                      UniqueIndex < Index
#                      PrimaryKey  < UniqueIndex
#                      ForeignKey
#                      Reference
#
#                      OrderedSet
#                      Columns       (has-a OrderedSet)
#                      Indexes       (has-a OrderedSet)
#                      UniqueIndexes (has-a OrderedSet)
#                      ForeignKeys   (has-a OrderedSet)
#
#
# ---------------------------------------------------------------
# NOTE
# ---------------------------------------------------------------
# Table, Index, UniqueIndex, PrimaryKey, ForeignKey and Reference
# are Enumerable, and delegate #each to #columns
# ---------------------------------------------------------------


uri = Addressable::URI.parse('mysql://localhost/dm_core_test')

database = DataObjects::Schema.load(uri)

database.name                  # => "dm_core_test"
database.uri                   # => uri
database.tables                # => Tables.new([ Table ])

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

end


# --------------------------------------------------------------------------------------------
#                             Database manipulation API
# --------------------------------------------------------------------------------------------


DataObjects::Schema.create_database(uri)

DataObjects::Schema.drop_database(uri)


DataObjects::Schema.database

DataObjects::Schema.database(uri) do


  execute 'statement'

  execute [ 'statement', bind, variables ]


  select 'query'

  select [ 'query', bind, variables ]


  create_table :people do

    column :id,    Auto,    :key => true
    column :name,  String,  :required => true, :default => 'foo'
    column :age,   Integer, :required => true, :check => 'age > 16'
    column :token, String,  :required => true

    index 'name_index', :name

    unique_index 'unique_token', :token

  end

  create_table :tasks do

    column :id,   Auto,   :key => true
    column :name, String, :required => true

    unique_index 'index_name', :name

  end

  create_table :jobs do

    column :id,   Auto,   :key => true
    column :name, String, :required => true

    unique_index 'unique_name', :name

  end

  create_table :people_tasks do

    # The :key and :references options provide shortcuts to the explicit
    # declarations of primary and foreign keys as seen below.
    #
    # NOTE
    # Foreign keys referencing more than one column, need to be declared
    # using the explicit syntax shown in the definition of the :workloads
    # table below.

    column :person_id, String  #, :key => true, :references => 'people.id'
    column :task_id,   Integer #, :key => true, :references => 'tasks.id'

    primary_key [ :person_id, :task_id ]

    foreign_key 'person_fk', :person_id, :references => 'people.id'
    foreign_key 'task_fk',   :task_id,   :references => 'tasks.id'

  end

  create_table :workloads do

    # The [ :id, :person_id, :task_id ] columns
    # form the primary key of this table.

    column :id,          Auto,    :key => true
    column :person_id,   String,  :key => true
    column :task_id,     Integer, :key => true
    column :description, Text

    # The foreign key must be declared explicitly since it references more than one column
    # There are two ways two declare multi column foreign keys. The outcome is identical!

    # Provide the information needed via arguments to #foreign_key
    foreign_key 'people_tasks_fk', [ :person_id, :task_id ], :references => 'people_tasks(person_id, task_id)'

    # Provide the information needed by passing a block to #foreign_key
    foreign_key 'people_tasks_fk' do
      column :person_id, :references => 'people.id'
      column :tasks_id,  :references => 'tasks.id'
    end

  end

  alter_table :people do

    # Adds a column. Complains if that column already exists
    add_column :hobby, String, :required => false, :default => 'Table Tennis'

  end

  alter_table :people do

    # Modifies an existing column. Complains if that column doesn't yet exist
    modify_column :hobby, String, :required => true,  :default => 'Programming'

  end

  alter_table :people do

    # Renames a column. Complains if that column doesn't yet exist
    rename_column :hobby, :to => :work

  end

  alter_table :people do

    # Adds a foreign key. Complains if that foreign key already exists
    add_foreign_key 'work_fk', [ :work ], :references => 'jobs.name'

    # Drops a foreign key. Complains if that foreign key doesn't exist yet
    drop_foreign_key 'work_fk'

    # Drops any constraint identified by the given name. Complains if
    # that constraint doesn't yet exist.
    drop_constraint 'work_fk'

  end

  alter_table :people do

    # Drops a column. Complains if that column doesn't yet exist
    drop_column :hobby

  end

  alter_table :workloads do

    drop_foreign_key 'people_tasks_fk'

    add_foreign_key 'people_tasks_fk' do
      column :person_id, :references => 'people.id'
      column :tasks_id,  :references => 'tasks.id'
    end

  end

  drop_table :name do

    before do

    end

    after do

    end

  end

end

