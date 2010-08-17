module DataObjects::Schema::Adapters::Sqlite3

  class Adapter < DataObjects::Schema::Adapters::Adapter

    IDENTIFIER_MAX_LENGTH = 128

    def tables(database=nil)
      sql    = "SELECT name FROM sqlite_master WHERE type='table';"
      tables = []
      reader = connection.create_command(sql).execute_reader

      while reader.next!
        tables << reader.values
      end

      tables.flatten.map { |name| DataObjects::Schema::Table.new(database, name) }
    end

    def columns(table)
      table_name = quote_table_name(table)
      sql        = "PRAGMA table_info(#{table_name})"
      reader     = connection.create_command(sql).execute_reader

      reader.map do |r|
        DataObjects::Schema::Column.new(r["name"], r["dflt_value"], r["type"], !r["notnull"])
      end
    end

    def quote_table_name(name)
      "\"#{name[0, self.class::IDENTIFIER_MAX_LENGTH].gsub('"', '""')}\""
    end
  end
end
