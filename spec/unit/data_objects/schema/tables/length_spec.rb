require 'spec_helper'
require 'do-schema/table'
require 'spec/unit/data_objects/schema/set/length_spec'

describe 'DataObjects::Schema::Tables#length' do

  subject { tables.length }

  context 'when no entry is present' do

    let(:tables) { DataObjects::Schema::Tables.new }

    it_should_behave_like 'DataObjects::Schema::Set#length when no entry is present'

  end

  context 'when 1 entry is present' do

    let(:tables) { DataObjects::Schema::Tables.new([table]) }
    let(:table)  { DataObjects::Schema::Table.new('name')   }

    it_should_behave_like 'DataObjects::Schema::Set#length when 1 entry is present'

  end

  context 'when more than 1 entry is present' do

    let(:tables)  { DataObjects::Schema::Tables.new(entries) }

    let(:entries) { [table1, table2]                         }

    let(:table1)  { DataObjects::Schema::Table.new('table1') }
    let(:table2)  { DataObjects::Schema::Table.new('table2') }

    let(:expected_length) { entries.length                   }

    it_should_behave_like 'DataObjects::Schema::Set#length when more than 1 entry is present'

  end

end


