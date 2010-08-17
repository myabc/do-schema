module DataObjects::Schema::Adapters

  class Adapter

    attr_reader :connection

    def initialize(connection)
      @connection = connection
    end

    def database
      DataObjects::Schema::Database.new(self)
    end

  end
end
