module DataObjects::Schema::Adapters::Postgres
  class Adapter < DataObjects::Schema::Adapters::Adapter

    def columns(table)
    end

    def tables(database)
      sql = <<-SQL
      SELECT table_name FROM information_schema.tables
      WHERE information_schema.tables.table_schema = ?
      AND information_schema.tables.table_type   = 'BASE TABLE'
      SQL

      if catalog
        sql << "AND information_schema.tables.table_catalog = ?"
      else
        sql << "AND information_schema.tables.table_catalog IS ?"
      end

      command = connection.create_command(sql)

      reader = command.execute_reader(default_schema, catalog)
      reader.map do |row|
        DataObjects::Schema::Table.new(database, row['table_name'])
      end
    end

    private

    def catalog
      database.name
    end

    def default_schema
      'public'
    end
  end
end
