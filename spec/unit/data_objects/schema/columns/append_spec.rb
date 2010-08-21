require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Columns#<<' do

  subject { columns << column2 }

  let(:column1)  { DataObjects::Schema::Column.new('name', {}) }
  let(:column2)  { DataObjects::Schema::Column.new('name', {}) }

  let(:columns)  { DataObjects::Schema::Columns.new([column1]) }

  its(:entries) { should include(column1) }
  its(:entries) { should include(column2) }

  it 'should append columns at the end of the collection' do
    columns.entries.index(column1).should == columns.entries.length - 2
    columns.entries.index(column2).should == columns.entries.length - 1
  end

end

