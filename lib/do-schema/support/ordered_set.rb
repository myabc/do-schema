require 'do-schema/support/collection'

module DataObjects
  module Schema

    class OrderedSet < Collection

      # Returns the OrderedSet instance
      #
      # @param [Array] entries
      #   optional entries
      #
      # @return [OrderedSet]
      #   the ordered set instance
      #
      # @api private
      def initialize(entries = nil)
        @index = {}
        super
      end

      # Append to the OrderedSet
      #
      # @param [Object] entry
      #   the object to append
      #
      # @return [OrderedSet]
      #   returns self
      #
      # @api private
      def <<(entry)
        return self if include?(entry)
        transform do
          @index[entry] = entries.length
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
        transform { other.each { |entry| self << entry } }
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

    end # class OrderedSet

  end # module Schema
end # module DataObjects

