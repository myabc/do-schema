require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/ordered_set/shared/index_spec'

describe 'DataObjects::Schema::OrderedSet#index' do

  context 'when the entry is not present' do

    let(:entry)       { 1 }
    let(:ordered_set) { DataObjects::Schema::OrderedSet.new }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#index when the entry is not present'

  end

  context 'when 1 entry is present' do

    let(:entry)       { 1 }
    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([entry]) }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#index when 1 entry is present'

  end

  context 'when 2 entries are present' do

    let(:entry)       { 1 }
    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([2,entry]) }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#index when 2 entries are present'

  end

end

