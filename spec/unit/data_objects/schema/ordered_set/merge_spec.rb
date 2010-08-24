require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/ordered_set/shared/merge_spec'

describe 'DataObjects::Schema::OrderedSet#merge' do

  context 'when merging two empty collections' do

    subject { ordered_set.merge([]) }

    let(:ordered_set) { collection }
    let(:collection)  { DataObjects::Schema::OrderedSet.new }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#merge when merging two empty collections'

  end

  context 'when merging a collection with already present entries' do

    subject { ordered_set.merge([entry]) }

    let(:ordered_set) { collection }

    let(:entry)       { 1                                            }
    let(:collection)  { DataObjects::Schema::OrderedSet.new([entry]) }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#merge when merging a collection with already present entries'

  end

  context 'when merging a collection with not yet present entries' do

    subject { ordered_set.merge([entry2]) }

    let(:ordered_set) { collection                                    }

    let(:entry1)      { 1                                             }
    let(:entry2)      { 2                                             }
    let(:collection)  { DataObjects::Schema::OrderedSet.new([entry1]) }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#merge when merging a collection with not yet present entries'

  end

end

