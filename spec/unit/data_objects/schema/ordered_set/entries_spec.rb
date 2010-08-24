require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/collection/entries_spec'

describe 'DataObjects::Schema::OrderedSet#entries' do

  subject { ordered_set.entries }

  let(:ordered_set) { collection }

  context 'with no entries' do

    let(:collection) { DataObjects::Schema::OrderedSet.new }

    it_should_behave_like 'DataObjects::Schema::Collection#entries with no entries'

  end

  context 'with entries' do

    let(:entry)      { 1                                         }
    let(:collection) { DataObjects::Schema::Columns.new([entry]) }

    it_should_behave_like 'DataObjects::Schema::Collection#entries with entries'

  end

end

