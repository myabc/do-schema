require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Columns#<<' do

  subject { columns << column2 }

  let(:column1)  { DataObjects::Schema::Column.new('column1', {}) }
  let(:columns)  { DataObjects::Schema::Columns.new([column1]) }

  context 'when appending a not yet present column' do

    let(:column2)  { DataObjects::Schema::Column.new('column2', {}) }

    its(:entries) { should include(column1) }
    its(:entries) { should include(column2) }

    it 'should not alter the position of the already existing column' do
      subject.entries.index(column1).should == columns.entries.length - 2
    end

    it 'should append columns at the end of the collection' do
      subject.entries.index(column2).should == columns.entries.length - 1
    end

    it 'adds one table to the collection' do
      expect { subject }.to change { columns.entries.count }.from(1).to(2)
    end


  end

  context 'when appending an already present column' do

    let(:column2)  { column1.dup }

    its(:entries) { should include(column1) }
    its(:entries) { should include(column2) }

    it 'should not alter the position of the already existing column' do
      subject.entries.index(column1).should == columns.entries.length - 1
    end

    it 'does not add a table to the collection' do
      expect { subject }.to_not change { columns.entries.count }
    end

  end

end

