module DataObjects::Schema

  class Database

    attr_reader :name
    attr_reader :uri

    def initialize(name, uri)
      @name   = name
      @uri    = uri
    end

  end
end
