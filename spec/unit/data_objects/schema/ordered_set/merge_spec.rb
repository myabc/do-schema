require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#merge' do

  context 'when merging two empty sets' do

    subject { ordered_set.merge([]) }

    let(:ordered_set) { set                                 }

    let(:set)         { DataObjects::Schema::OrderedSet.new }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#merge when merging two empty sets'

  end

  context 'when merging a set with already present entries' do

    subject { ordered_set.merge([entry]) }

    let(:ordered_set) { set                                          }

    let(:set)         { DataObjects::Schema::OrderedSet.new([entry]) }
    let(:entry)       { 1                                            }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#merge when merging a set with already present entries'

  end

  context 'when merging a set with not yet present entries' do

    subject { ordered_set.merge([entry2]) }

    let(:ordered_set) { set                                           }

    let(:set)         { DataObjects::Schema::OrderedSet.new([entry1]) }
    let(:entry1)      { 1                                             }
    let(:entry2)      { 2                                             }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#merge when merging a set with not yet present entries'

  end

end
