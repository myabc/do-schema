require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#index' do

  subject { ordered_set.index(entry) }

  context 'when the entry is not present' do

    let(:entry)       { 1 }
    let(:ordered_set) { DataObjects::Schema::OrderedSet.new }

    it { should be(nil) }

  end

  context 'when 1 entry is present' do

    let(:entry)       { 1 }
    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([entry]) }

    it { should == 0 }

  end

  context 'when 2 entries are present' do

    let(:entry)       { 1 }
    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([2,entry]) }

    it { should == 1 }

  end

end

