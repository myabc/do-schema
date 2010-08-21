require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#length' do

  subject { ordered_set.length }

  context 'when no entry is present' do

    let(:ordered_set) { DataObjects::Schema::OrderedSet.new }

    it { should == 0 }

  end

  context 'when 1 entry is present' do

    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([1]) }

    it { should == 1 }

  end

  context 'when more than 1 entry is present' do

    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([1,2]) }

    it { should == 2 }

  end

end

