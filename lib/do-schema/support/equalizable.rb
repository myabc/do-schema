module DataObjects
  module Schema

    module Equalizable

      def equalize(*methods)
        define_eql_method(methods)
        define_equivalent_method(methods)
        define_hash_method(methods)
      end

      private

      def define_eql_method(methods)
        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def eql?(other)

            # NOTE the following optimization is left out currently
            # because I haven't yet found a feasible way to get heckle
            # to pass with that code in place
            #
            # return true if equal?(other)

            instance_of?(other.class) &&
            #{methods.map { |method| "#{method}.eql?(other.#{method})" }.join(' && ')}
          end
        RUBY
      end

      def define_equivalent_method(methods)
        respond_to = []
        equivalent = []

        methods.each do |method|
          respond_to << "other.respond_to?(#{method.inspect})"
          equivalent << "#{method} == other.#{method}"
        end

        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def ==(other)

            # NOTE the following optimization is left out currently
            # because I haven't yet found a feasible way to get heckle
            # to pass with that code in place
            #
            # return true if equal?(other)

            return false unless kind_of?(other.class) || other.kind_of?(self.class)

            # This is not necessary when relying on #kind_of? already
            # If we decide to rely on duck typing only, this code must
            # be readded

            # #{respond_to.join(' && ')} &&

            #{equivalent.join(' && ')}
          end
        RUBY
      end

      def define_hash_method(methods)
        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def hash
            #{methods.map { |method| "#{method}.hash" }.join(' ^ ')}
          end
        RUBY
      end

    end # module Equalizable

  end # module Schema
end # module DataObjects

