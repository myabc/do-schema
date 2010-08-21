require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Tables#<<' do

  subject { tables << table2 }

  let(:table1)  { DataObjects::Schema::Table.new('table1')  }
  let(:tables)  { DataObjects::Schema::Tables.new([table1]) }

  context 'when appending a not yet present table' do

    let(:table2)  { DataObjects::Schema::Table.new('table2') }

    its(:entries) { should include(table1) }
    its(:entries) { should include(table2) }

    it 'adds one table to the collection' do
      expect { subject }.to change { tables.entries.count }.from(1).to(2)
    end

  end

  context 'when appending an already present table' do

    let(:table2)  { table1.dup }

    its(:entries) { should include(table1) }
    its(:entries) { should include(table2) }

    it 'does not add a table to the collection' do
      expect { subject }.to_not change { tables.entries.count }
    end

  end

end

