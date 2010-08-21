require 'do-schema/support/ordered_set'
require 'do-schema/support/equalizable'
require 'do-schema/support/transformable'

module DataObjects::Schema

  class Columns

    include Enumerable
    include Transformable

    extend Equalizable

    attr_reader :entries

    equalize :entries

    def initialize(columns = [])
      @entries = OrderedSet.new
      merge(columns)
    end

    # Append to the Columns collection
    #
    # @param [Column] column
    #   the column to append
    #
    # @return [ Columns]
    #   returns self
    #
    # @api private
    def <<(column)
      transform { @entries << column }
    end

    def merge(other)
      transform { other.each { |entry| @entries << entry } }
    end

    def each(&block)
      @entries.each(&block)
      self
    end

    def empty?
      @entries.empty?
    end

    def to_ddl
      raise NotImplementedError
    end

  end

  class Column

    extend Equalizable

    attr_reader :name
    attr_reader :options
    attr_reader :default

    equalize :name, :default, :required?

    def initialize(name, options)
      @name     = name
      @options  = default_options.merge(options)
      @default  = @options[:default]
      @required = @options[:required]
    end

    # @api public
    def required?
      @required
    end

    # @api public
    def to_ddl
      raise NotImplementedError
    end

    # @api semipublic
    def default_options
      { :required => true }
    end

  end
end
