require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Column#initialize' do

  let(:name) { 'foo' }

  shared_examples_for 'calling DataObjects::Schema::Column#initialize' do

    its(:name) { should == name }

  end

  context 'when an empty hash of options is given' do

    subject { DataObjects::Schema::Column.new(name, {}) }

    let(:default_options) { { :required => true} }

    it_should_behave_like 'calling DataObjects::Schema::Column#initialize'

    its(:default) { should be(nil)            }

    it { should be_required }

  end

  context 'when the given options are the same as the default options' do

    subject { DataObjects::Schema::Column.new(name, {}) }

    let(:default_options) { { :required => true} }
    let(:options)         { { :required => true} }

    it_should_behave_like 'calling DataObjects::Schema::Column#initialize'

    its(:default) { should be(nil)            }

    it { should be_required }

  end

  context 'when the given options differ form the default options' do

    subject { DataObjects::Schema::Column.new(name, options) }

    let(:options) { { :default => 'foo', :required => false } }

    it_should_behave_like 'calling DataObjects::Schema::Column#initialize'

    its(:default) { should == 'foo'   }

    it { should_not be_required }

  end

end

