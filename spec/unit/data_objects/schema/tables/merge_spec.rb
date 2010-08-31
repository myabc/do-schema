require 'spec_helper'
require 'do-schema/table'
require 'spec/unit/data_objects/schema/ordered_set/shared/merge_spec'

describe 'DataObjects::Schema::Tables#merge' do

  context 'when merging two empty sets' do

    subject { tables.merge([]) }

    let(:tables) { set                             }
    let(:set)    { DataObjects::Schema::Tables.new }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#merge when merging two empty sets'

  end

  context 'when merging a set with already present entries' do

    subject { tables.merge([entry]) }

    let(:tables) { set                                      }

    let(:set)    { DataObjects::Schema::Tables.new([entry]) }
    let(:entry)  { DataObjects::Schema::Table.new('name')   }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#merge when merging a set with already present entries'

  end

  context 'when merging a set with not yet present entries' do

    subject { tables.merge([entry2]) }

    let(:tables) { set                                       }

    let(:set)    { DataObjects::Schema::Tables.new([entry1]) }
    let(:entry1) { DataObjects::Schema::Table.new('entry1')  }
    let(:entry2) { DataObjects::Schema::Table.new('entry2')  }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#merge when merging a set with not yet present entries'

  end
end

