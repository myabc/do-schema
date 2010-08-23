require 'addressable/uri'
require 'do-schema/table'

module DataObjects
  module Schema

    class Database

      attr_reader :name
      attr_reader :uri
      attr_reader :tables

      def initialize(name, uri, tables = [])
        @name   = name
        @uri    = uri
        @tables = Tables.new(tables)
      end

      def empty?
        @tables.empty?
      end

    end # class Database

  end # module Schema
end # module DataObjects

