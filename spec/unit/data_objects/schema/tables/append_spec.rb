require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Tables#<<' do

  subject { tables << table2 }

  let(:table1)  { DataObjects::Schema::Column.new('column1', {}) }
  let(:table2)  { DataObjects::Schema::Column.new('column2', {}) }

  let(:tables)  { DataObjects::Schema::Columns.new([table1]) }

  its(:entries) { should include(table1) }
  its(:entries) { should include(table2) }

  it 'should append columns at the end of the collection' do
    tables.entries.index(table1).should == tables.entries.length - 2
    tables.entries.index(table2).should == tables.entries.length - 1
  end

end

