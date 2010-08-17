module DataObjects::Schema

  class Database

    attr_reader :adapter

    def initialize(adapter)
      @adapter = adapter
    end

    def name
      adapter.connection.uri.path.gsub(/^\//, '')
    end

    def uri
      adapter.connection.uri
    end

    def tables
      adapter.tables(self)
    end

    def table_exists?(name)
      !table(name).nil?
    end

    def columns(table)
      adapter.columns(table)
    end

    def table(name)
      tables.select { |table| table.name == name }.first
    end

  end
end
