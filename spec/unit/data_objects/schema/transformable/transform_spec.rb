require 'spec_helper'
require 'do-schema/support/transformable'
require 'spec/unit/data_objects/schema/transformable/fixtures/dummy'

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

