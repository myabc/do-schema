require 'set'
require 'do-schema/support/transformable'
require 'do-schema/support/equalizable'

module DataObjects
  module Schema

    class Set

      include Enumerable
      include Transformable

      extend Equalizable

      attr_reader :entries

      equalize :entries

      def initialize(entries = nil)
        @entries = container
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
        transform_unless(include?(entry)) { entries << entry }
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
        transform { other.each { |entry| entries << entry } }
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

      # Check if there are any entries
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
        entries.include?(entry)
      end

    private

      def container
        ::Array.new
      end

    end # class Collection

  end # module Schema
end # module DataObjects

