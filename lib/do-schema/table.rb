require 'do-schema/support/equalizable'
require 'do-schema/support/transformable'
require 'do-schema/column'

module DataObjects::Schema

  class Tables

    include Enumerable
    include Transformable

    extend Equalizable

    attr_reader :entries

    equalize :entries

    def initialize(tables = [])
      @entries = Set.new
      merge(tables)
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
      transform { @entries << table }
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
      transform { other.each { |table| @entries << table } }
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
      @entries.each(&block)
      self
    end

    def empty?
      @entries.empty?
    end

  end

  class Table

    include Enumerable
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

