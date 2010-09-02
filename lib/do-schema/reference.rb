require 'do-schema/index'

module DataObjects

  module Schema

    class Reference

      attr_reader :table
      attr_reader :columns

      def initialize(table, columns)
        @table   = table
        @columns = columns
      end

    end

  end # module Schema
end # module DataObjects

