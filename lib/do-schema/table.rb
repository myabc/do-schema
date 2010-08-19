require 'do-schema/support/equalizable'
require 'do-schema/support/transformable'

module DataObjects::Schema

  class Tables

    include Enumerable
    include Transformable

    extend Equalizable

    attr_reader :tables

    equalize :tables

    def initialize(tables = [])
      @tables = Set.new
      merge(tables)
      freeze
    end

    # Append to the Tables collection
    #
    # @param [Table] table
    #   the table to append
    #
    # @return [Tables]
    #   returns self
    #
    # @api public
    def <<(table)
      transform { @tables << table }
    end

    # Merge in another Tables collection
    #
    # @param [#each] other
    #   the other Tables collection
    #
    # @return [Tables]
    #   returns self
    #
    # @api public
    def merge(other)
      transform { other.each { |table| @tables << table } }
    end

    # Iterate over each table in the collection
    #
    # @yield [entry]
    #   yield to the entry
    #
    # @yieldparam [Table] table
    #   a table in the collection
    #
    # @return [Tables]
    #   returns self
    #
    # @api public
    def each(&block)
      @tables.each(&block)
      self
    end

    def empty?
      @tables.empty?
    end

  end

  class Table

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

    def to_ddl
      raise NotImplementedError
    end

  end
end
