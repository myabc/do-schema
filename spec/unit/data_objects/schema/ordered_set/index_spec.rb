require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#index' do

  subject { ordered_set.index(entry) }

  context 'when the entry is not present' do

    let(:ordered_set) { DataObjects::Schema::OrderedSet.new }
    let(:entry)       { 1                                   }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#index when the entry is not present'

  end

  context 'when 1 entry is present' do

    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([entry]) }
    let(:entry)       { 1                                            }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#index when 1 entry is present'

  end

  context 'when 2 entries are present' do

    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([2,entry]) }
    let(:entry)       { 1                                              }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#index when 2 entries are present'

  end

end
