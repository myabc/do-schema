require 'spec_helper'
require 'do-schema/column'

module DataObjects::Schema::Specs

  # Used to test duck typing behavior
  class ColumnsDuck
    attr_reader :entries

    def initialize(columns = [])
      @entries = DataObjects::Schema::OrderedSet.new
    end
  end
end

describe 'DataObjects::Schema::Columns#==' do

  subject { columns == other }

  let(:original_column)  { DataObjects::Schema::Column.new('name', {}) }
  let(:columns)          { DataObjects::Schema::Columns.new([original_column]) }

  context 'with the same columns' do

    let(:other) { columns }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == columns)
    end
  end

  context 'with equivalent columns' do

    let(:other) { columns.dup }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == columns)
    end
  end

  # TODO This probably needs more thought
  context 'with a class that quacks like Columns and is equivalent otherwise' do

    let(:other) { DataObjects::Schema::Specs::ColumnsDuck.new([original_column]) }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == columns)
    end
  end

  context 'with a subclass that is equivalent otherwise' do

    let(:other) { Class.new(DataObjects::Schema::Columns).new([original_column]) }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == columns)
    end
  end

  context 'with both containing no columns' do

    let(:columns) { DataObjects::Schema::Columns.new }
    let(:other)   { DataObjects::Schema::Columns.new }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == columns)
    end
  end

  context 'with different columns' do

    let(:different_column) { DataObjects::Schema::Column.new('different', {})                       }
    let(:other)            { DataObjects::Schema::Columns.new([different_column])  }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == columns)
    end

  end

end
