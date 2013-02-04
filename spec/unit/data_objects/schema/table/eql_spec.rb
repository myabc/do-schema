require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Table#eql?' do

  subject { table.eql?(other) }

  let(:name)             { 'name'                                                 }
  let(:original_column)  { DataObjects::Schema::Column.new(name, {})              }
  let(:original_columns) { [original_column]                                      }
  let(:table)            { DataObjects::Schema::Table.new(name, original_columns) }

  context 'with the same table' do

    let(:other) { table }

    it { should be(true) }

    it 'is symmetric' do
      should == other.eql?(table)
    end
  end

  context 'with an equivalent table' do

    let(:other) { table.dup }

    it { should be(true) }

    it 'is symmetric' do
      should == other.eql?(table)
    end
  end

  context 'with a table with the same name and different columns' do

    let(:column)  { DataObjects::Schema::Column.new('different', {}) }
    let(:columns) { DataObjects::Schema::Columns.new([column])       }

    let(:other) { DataObjects::Schema::Table.new(name, columns) }

    it { should be(false) }

    it 'is symmetric' do
      should == other.eql?(table)
    end

  end

  context 'with a table with a different name and same columns' do

    #let(:name)  { 'different' }
    let(:other) { DataObjects::Schema::Table.new('different', original_columns) }

    it { should be(false) }

    it 'is symmetric' do
      should == other.eql?(table)
    end

  end

  context 'with a table with a different name and different columns' do

    let(:name)    { 'different' }
    let(:column)  { DataObjects::Schema::Column.new('name', {}) }
    let(:columns) { DataObjects::Schema::Columns.new([column])  }

    let(:other) { DataObjects::Schema::Table.new(name, columns) }

    it { should be(false) }

    it 'is symmetric' do
      should == other.eql?(table)
    end

  end

end
