require 'do-schema/support/ordered_set'
require 'do-schema/column'

module DataObjects

  module Schema

    class Index

      attr_reader :name
      attr_reader :columns

      def initialize(name, columns)
        @name    = name
        @columns = Columns.new(columns)
      end

      def unique?
        false
      end

    end

    class UniqueIndex < Index

      def unique?
        true
      end

    end

    class Indexes < OrderedSet
    end

    class UniqueIndexes < OrderedSet
    end

  end # module Schema
end # module DataObjects

