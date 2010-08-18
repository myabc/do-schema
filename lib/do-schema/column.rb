module DataObjects::Schema

  class Column

    attr_reader :name, :default, :null, :type

    def initialize(name, default, sql_type = nil, null = false)
      @name    = name
      @default = default
      @type    = type_map[sql_type.upcase.gsub(/\(.*\)/, "")] # remove length
      @null    = null
    end

    protected

    def type_map
      {
        "BLOB"      => :string,
        "INTEGER"   => :integer,
        "INT"       => :integer,
        "VARCHAR"   => :string,
        "DECIMAL"   => :decimal,
        "FLOAT"     => :float,
        "TIMESTAMP" => :timestamp,
        "DATE"      => :date,
        "TIMESTAMP" => :time,
        "BOOLEAN"   => :boolean,
        "TEXT"      => :text,
      }
    end

  end
end
