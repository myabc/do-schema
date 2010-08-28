require 'do-schema/support/collection'
require 'do-schema/column'

module DataObjects
  module Schema

    class Tables < Collection
    end

    class Table

      include Enumerable
      extend Equalizable

      attr_reader :name
      attr_reader :columns

      equalize :name, :columns

      def initialize(name, columns = [])
        @name    = name
        @columns = Columns.new(columns)
      end

      def each(&block)
        columns.each(&block)
        self
      end

    end # class Table

  end # module Schema
end # module DataObjects

