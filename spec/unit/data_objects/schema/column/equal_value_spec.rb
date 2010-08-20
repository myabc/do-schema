require 'spec_helper'
require 'do-schema/column'

module DataObjects::Schema::Specs

  # Used to test duck typing behavior
  class ColumnDuck
    attr_reader :name
    attr_reader :default

    def initialize(name, options)
      @name, @options = name, options
      @default  = options[:default]
      @required = options[:required]
    end
    def required?
      @required
    end
  end
end

describe 'DataObjects::Schema::Column#==' do

  subject { column == other }

  let(:name)             { 'foo'                                                   }
  let(:original_options) { { :default => 'foo', :required => true }                }
  let(:column)           { DataObjects::Schema::Column.new(name, original_options) }

  context 'with the same column' do

    let(:other) { column }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == column)
    end
  end

  context 'with an equivalent column' do

    let(:other) { column.dup }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == column)
    end
  end

  context 'with a column subclass that is otherwise equal' do

    let(:other) { Class.new(DataObjects::Schema::Column).new(name, original_options) }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == column)
    end
  end

  # TODO This probably needs more thought
  context 'with a class that quacks like a Column and is otherwise equal' do

    let(:other) { DataObjects::Schema::Specs::ColumnDuck.new(name, original_options) }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == column)
    end
  end

  context 'with a different name and the same options' do

    let(:other) { DataObjects::Schema::Column.new('different name', original_options) }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == column)
    end
  end

  context 'with a different name, a different default value and the same required status' do

    let(:other)   { DataObjects::Schema::Column.new('different name', options) }
    let(:options) { { :default => 'bar', :required => true } }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == column)
    end
  end

  context 'with a different name, a different default value and a different required status' do

    let(:other)   { DataObjects::Schema::Column.new('different name', options) }
    let(:options) { { :default => 'bar', :required => false } }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == column)
    end
  end

  context 'with the same name, a different default value and the same require status' do

    let(:other)   { DataObjects::Schema::Column.new(name, options) }
    let(:options) { { :default => 'bar', :required => true } }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == column)
    end

  end

  context 'with the same name, the same default value and a different required status' do

    let(:other)   { DataObjects::Schema::Column.new(name,options) }
    let(:options) { { :default => 'foo', :required => false } }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == column)
    end

  end

end

