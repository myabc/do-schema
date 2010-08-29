require 'do-schema/support/ordered_set'

module DataObjects
  module Schema

    class Columns < OrderedSet
    end

    class Column

      extend Equalizable

      attr_reader :name
      attr_reader :default

      equalize :name, :default, :required?

      def initialize(name, options)
        @name     = name
        @default  = options.fetch(:default, nil)
        @required = options.fetch(:required, default_options.fetch(:required))
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

