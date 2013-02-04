require 'do-schema/support/transformable'
require 'do-schema/support/equalizable'

module DataObjects
  module Schema

    class OrderedSet

      include Enumerable
      include Transformable

      extend Equalizable

      attr_reader :entries

      equalize :entries

      def initialize(entries = nil)
        @index   = {}
        @entries = []
        merge(entries || [])
      end

      # Ensures that this Collection contains the given entry
      #
      # @param [Object] entry
      #   the entry to add
      #
      # @return [Collection]
      #   returns self
      #
      # @api public
      def <<(entry)
        transform_unless(include?(entry)) do
          @index[entry] = length
          entries << entry
        end
      end

      # Merge in another Collection
      #
      # @param [#each] other
      #   the other Collection
      #
      # @return [Collection]
      #   returns self
      #
      # @api public
      def merge(other)
        other.inject(self) { |result, entry| result << entry }
      end

      # Iterate over each entry in the set
      #
      # @yield [entry]
      #   yield to the entry
      #
      # @yieldparam [Object] entry
      #   an entry in the set
      #
      # @return [Collection]
      #   returns self
      #
      # @api public
      def each(&block)
        entries.each(&block)
        self
      end

      # Check if the]e are any entries
      #
      # @return [Boolean]
      #
      # @api private
      def empty?
        entries.empty?
      end

      # The number of entries
      #
      # @return [Integer]
      #   number of entries
      #
      # @api private
      def length
        entries.length
      end

      # Check if the entry exists in the set
      #
      # @param [Object] entry
      #   the entry to test for
      #
      # @return [Boolean]
      #
      # @api private
      def include?(entry)
        @index.has_key?(entry)
      end

      # Return the index for the entry in the set
      #
      # @param [Object] entry
      #   the entry to check the set for
      #
      # @return [Integer, nil]
      #   the index for the entry, or nil if it does not exist
      #
      # @api private
      def index(entry)
        @index[entry]
      end

    end # class Collection

  end # module Schema
end # module DataObjects
