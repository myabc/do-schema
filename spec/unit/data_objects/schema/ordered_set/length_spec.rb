require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#length' do

  subject { ordered_set.length }

  context 'when no entry is present' do

    let(:ordered_set) { DataObjects::Schema::OrderedSet.new }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#length when no entry is present'

  end

  context 'when 1 entry is present' do

    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([1]) }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#length when 1 entry is present'

  end

  context 'when more than 1 entry is present' do

    let(:ordered_set)     { DataObjects::Schema::OrderedSet.new(entries) }
    let(:entries)         { [1,2]                                        }
    let(:expected_length) { entries.length                               }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#length when more than 1 entry is present'

  end

end
