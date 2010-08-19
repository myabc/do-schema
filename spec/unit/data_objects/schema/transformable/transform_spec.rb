require 'spec_helper'
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

end

describe 'DataObjects::Schema::Transformable#transform' do

  subject { instance.modify(delta) }

  let(:instance) { Immutable.new(state) }
  let(:state)    { 'foo'                }
  let(:delta)    { 'baz'                }

  it { should_not equal(instance)      }
  it { should be_instance_of(Immutable) }
  it { should be_frozen                 }

  its(:state) { should == state }
  its(:delta) { should == delta }

end

