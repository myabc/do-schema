require 'do-schema/support/transformable'

class Immutable

  include DataObjects::Schema::Transformable

  attr_reader :state, :delta

  def initialize(state)
    @state = state
    @delta = nil
  end

  def modify(delta)
    transform { @delta = delta }
  end

  def modify_unless(condition, delta)
    transform_unless(condition) { @delta = delta }
  end

end
