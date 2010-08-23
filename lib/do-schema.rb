require 'data_objects'

require 'do-schema/database'
require 'do-schema/table'
require 'do-schema/column'
require 'do-schema/column/integer'
require 'do-schema/column/string'

module DataObjects
  module Schema

    def self.load(uri)
      raise NotImplementedError
    end

  end
end

