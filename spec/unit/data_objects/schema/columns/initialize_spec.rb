require 'spec_helper'
require 'do-schema/column'
require 'spec/unit/data_objects/schema/ordered_set/shared/initialize_spec'

describe 'DataObjects::Schema::Columns#initialize' do

  context 'when no entries are given' do

    subject { DataObjects::Schema::Columns.new }

    it_should_behave_like 'DataObjects::Schema::Set#initialize when no entries are given'

  end

  context 'when entries are given' do

    subject { DataObjects::Schema::Columns.new(entries) }

    context 'and they do not contain duplicates' do

      let(:entries) { [entry1, entry2]                              }

      let(:entry1)  { DataObjects::Schema::Column.new('entry1', {}) }
      let(:entry2)  { DataObjects::Schema::Column.new('entry2', {}) }

      it_should_behave_like 'DataObjects::Schema::OrderedSet#initialize when entries are given and they do not contain duplicates'

    end

    context 'and they contain duplicates' do

      let(:entries) { [entry1, entry2]                              }

      let(:entry1)  { DataObjects::Schema::Column.new('entry1', {}) }
      let(:entry2)  { entry1.dup                                    }

      it_should_behave_like 'DataObjects::Schema::OrderedSet#initialize when entries are given and they contain duplicates'

    end
  end

end

