module DataObjects
  module Schema

    module Transformable

      private

      def transform(&block)
        copy = self.clone
        copy.instance_eval(&block)
        copy.freeze
      end

      def transform_unless(condition, &block)
        condition ? self : transform(&block)
      end

    end # module Transformable

  end # module Schema
end # module DataObjects

