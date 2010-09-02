require 'do-schema/support/ordered_set'
require 'do-schema/column'
require 'do-schema/index'

module DataObjects
  module Schema

    class Tables < OrderedSet
    end

    class Table

      include Enumerable
      extend Equalizable

      attr_reader :name
      attr_reader :columns
      attr_reader :constraints
      attr_reader :primary_key
      attr_reader :indexes
      attr_reader :unique_indexes

      equalize :name, :columns

      def initialize(name, columns = [], constraints = [], indexes = [])
        @name           = name
        @columns        = Columns.new(columns)
        @constraints    = TableConstraints.new(constraints)
        @primary_key    = @constraints.primary_key
        @indexes        = Indexes.new(indexes)
        @unique_indexes = @indexes.unique_indexes
      end

      def each(&block)
        columns.each(&block)
        self
      end

    end # class Table

  end # module Schema
end # module DataObjects

