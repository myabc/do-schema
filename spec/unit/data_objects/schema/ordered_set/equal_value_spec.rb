require 'spec_helper'
require 'do-schema/support/ordered_set'

module DataObjects::Schema::Specs

  # Used to test duck typing behavior
  class OrderedSetDuck
    attr_reader :entries

    def initialize(columns = [])
      @entries = DataObjects::Schema::OrderedSet.new
    end
  end
end

describe 'DataObjects::Schema::OrderedSet#==' do

  subject { ordered_set == other }

  let(:original_entry)  { 1                                                     }
  let(:ordered_set)     { DataObjects::Schema::OrderedSet.new([original_entry]) }

  context 'with the same ordered_set' do

    let(:other) { ordered_set }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == ordered_set)
    end
  end

  context 'with equivalent ordered_set' do

    let(:other) { ordered_set.dup }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == ordered_set)
    end
  end

  # TODO This probably needs more thought
  context 'with a class that quacks like OrderedSet and is equivalent otherwise' do

    let(:other) { DataObjects::Schema::Specs::OrderedSetDuck.new([original_entry]) }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == ordered_set)
    end
  end

  context 'with a subclass that is equivalent otherwise' do

    let(:other) { Class.new(DataObjects::Schema::OrderedSet).new([original_entry]) }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == ordered_set)
    end
  end

  context 'with both containing no ordered_set' do

    let(:ordered_set) { DataObjects::Schema::OrderedSet.new }
    let(:other)  { DataObjects::Schema::OrderedSet.new }

    it { should be(true) }

    it 'is symmetric' do
      should == (other == ordered_set)
    end
  end

  context 'with different ordered_set' do

    let(:different_entry) { 2                                                      }
    let(:other)           { DataObjects::Schema::OrderedSet.new([different_entry]) }

    it { should be(false) }

    it 'is symmetric' do
      should == (other == ordered_set)
    end

  end

end
