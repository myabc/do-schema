module DataObjects::Schema::Adapters::Sqlite3
  class Adapter < DataObjects::Schema::Adapters::Adapter

    def tables(database=nil)
      sql = "SELECT name FROM sqlite_master WHERE type='table';"
      tables = []
      reader = connection.create_command(sql).execute_reader
      while reader.next!
        tables << reader.values
      end
      tables.flatten
    end
  end
end
