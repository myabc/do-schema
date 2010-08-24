require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/ordered_set/shared/initialize_spec'

describe 'DataObjects::Schema::OrderedSet#initialize' do

  context 'when no entries are given' do

    subject { DataObjects::Schema::OrderedSet.new }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#initialize when no entries are given'

  end

  context 'when entries are given' do

    subject { DataObjects::Schema::OrderedSet.new(entries) }

    context 'and they do not contain duplicates' do

      let(:entries) { [entry1, entry2] }

      let(:entry1)  { 1                }
      let(:entry2)  { 2                }

      it_should_behave_like 'DataObjects::Schema::OrderedSet#initialize when entries are given and they do not contain duplicates'

    end

    context 'and they contain duplicates' do

      let(:entries) { [entry1, entry2] }

      let(:entry1)  { 1                }
      let(:entry2)  { 1                }

      it_should_behave_like 'DataObjects::Schema::OrderedSet#initialize when entries are given and they contain duplicates'

    end

  end

end

