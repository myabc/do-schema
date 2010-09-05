module DataObjects

  module Schema

    class Constraint

      attr_reader :name

      def initialize(name)
        @name = name
      end

      class NotNull < Constraint
      end

      class Default < Constraint

        attr_reader :value

        def initialize(name, value)
          super(name)
          @value = value
        end

      end

      class Check < Constraint

        attr_reader :expression

        def initialize(name, expression)
          super(name)
          @expression = expression
        end

      end

      class TableConstraint < Constraint

        attr_reader :columns

        def initialize(name, columns)
          super(name)
          @columns = Columns.new(columns)
        end

      end

      class Unique < TableConstraint
      end

      class PrimaryKey < Unique
      end

      class ForeignKey < TableConstraint

        attr_reader :reference
        attr_reader :on_delete
        attr_reader :on_update

        def initialize(name, columns, reference, options)
          super(name, columns)
          @reference = reference
          @on_delete = options.fetch(:on_delete, :restrict)
          @on_update = options.fetch(:on_update, :restrict)
        end

      end

    end

    class ColumnConstraints < OrderedSet

      def initialize(entries = nil)
        super(entries)
        # TODO is this really necessary?
        raise unless entries.all? { |c| c.is_a?(ColumnConstraint)}
      end

    end

    class TableConstraints < OrderedSet

      def initialize(entries = nil)
        super(entries)
        # TODO is this really necessary?
        raise unless entries.all? { |c| c.is_a?(TableConstraint)}
      end

      def primary_key
        entries.find { |constraint| constraint.is_a?(PrimaryKey) }
      end

    end

  end # module Schema
end # module DataObjects

