module DataObjects::Schema

  module Transformable

    private

    def transform(&block)
      copy = self.clone
      copy.instance_eval(&block)
      copy.freeze
    end

  end
end

