require 'spec_helper'
require 'do-schema/table'

module DataObjects::Schema::Specs

  # Used to test duck typing behavior
  class TableDuck
    attr_reader :name
    attr_reader :columns

    def initialize(name, columns = [])
      @name, @options = name, DataObjects::Schema::Columns.new(columns)
    end
  end
end

describe 'DataObjects::Schema::Table#==' do

  subject { table == other }

  let(:name)             { 'name'                                                 }
  let(:original_column)  { DataObjects::Schema::Column.new(name, {})              }
  let(:original_columns) { [original_column]                                      }
  let(:table)            { DataObjects::Schema::Table.new(name, original_columns) }

  context 'with the same table' do

    let(:other) { table }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == table)
    end
  end

  context 'with an equivalent table' do

    let(:other) { table.dup }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == table)
    end
  end

  # TODO This probably needs more thought
  context 'with a class that quacks like a Table and is equivalent otherwise' do

    let(:other) { DataObjects::Schema::Specs::TableDuck.new(name, original_columns) }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == table)
    end
  end

  context 'with a subclass that is equivalent otherwise' do

    let(:other) { Class.new(DataObjects::Schema::Table).new(name, original_columns) }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == table)
    end
  end

  context 'with a table with the same name and different columns' do

    let(:column)  { DataObjects::Schema::Column.new('different', {}) }
    let(:columns) { DataObjects::Schema::Columns.new([column])       }

    let(:other) { DataObjects::Schema::Table.new(name, columns) }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == table)
    end

  end

  context 'with a table with a different name and same columns' do

    #let(:name)  { 'different' }
    let(:other) { DataObjects::Schema::Table.new('different', original_columns) }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == table)
    end

  end

  context 'with a table with a different name and different columns' do

    let(:name)    { 'different' }
    let(:column)  { DataObjects::Schema::Column.new('name', {}) }
    let(:columns) { DataObjects::Schema::Columns.new([column])  }

    let(:other) { DataObjects::Schema::Table.new(name, columns) }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == table)
    end

  end

end

