require 'spec_helper'
require 'do-schema/column'
require 'spec/unit/data_objects/schema/ordered_set/shared/merge_spec'

describe 'DataObjects::Schema::Columns#merge' do

  context 'when merging two empty sets' do

    subject { columns.merge([]) }

    let(:columns) { set                              }

    let(:set)     { DataObjects::Schema::Columns.new }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#merge when merging two empty sets'

  end

  context 'when merging a set with already present entries' do

    subject { columns.merge([entry]) }

    let(:columns) { set                                         }

    let(:set)     { DataObjects::Schema::Columns.new([entry] )  }
    let(:entry)   { DataObjects::Schema::Column.new('name', {}) }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#merge when merging a set with already present entries'

  end

  context 'when merging a set with not yet present entries' do

    subject { columns.merge([entry2]) }

    let(:columns) { set                                           }

    let(:set)     { DataObjects::Schema::Columns.new([entry1])    }
    let(:entry1)  { DataObjects::Schema::Column.new('entry1', {}) }
    let(:entry2)  { DataObjects::Schema::Column.new('entry2', {}) }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#merge when merging a set with not yet present entries'

  end

end

