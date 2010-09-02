require 'do-schema/support/ordered_set'

module DataObjects
  module Schema

    class Columns < OrderedSet
    end

    class Column

      extend Equalizable

      attr_reader :name
      attr_reader :default
      attr_reader :constraints

      equalize :name, :default, :required?

      def initialize(name, options = {}, constraints = [])
        @name     = name
        # TODO think about replacing options with constraints
        @default  = options.fetch(:default, nil)
        @required = options.fetch(:required, default_options.fetch(:required))
        @constraints = ColumnConstraints.new(constraints)
      end

      # @api public
      def required?
        @required
      end

      # @api semipublic
      def default_options
        { :required => true }
      end

    end # class Column

  end # module Schema
end # module DataObjects

