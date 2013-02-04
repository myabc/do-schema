require 'spec_helper'
require 'do-schema/support/transformable'

describe 'DataObjects::Schema::Transformable#transform_unless' do

  let(:instance) { Immutable.new(state) }
  let(:state)    { 'foo'                }
  let(:delta)    { 'baz'                }

  context 'when the condition evaluates to true' do

    subject { instance.modify_unless(true, delta) }

    it { should equal(instance) }
    it { should_not be_frozen   }

    its(:state) { should == state }
    its(:delta) { should == nil }

  end

  context 'when the condition evaluates to false' do

    subject { instance.modify_unless(false, delta) }

    it { should_not equal(instance)       }
    it { should be_instance_of(Immutable) }
    it { should be_frozen                 }

    its(:state) { should == state }
    its(:delta) { should == delta }

  end

end
