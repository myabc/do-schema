require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#eql?' do

  subject { ordered_set.eql?(other) }

  let(:original_entry)  { 1                                                     }
  let(:ordered_set)     { DataObjects::Schema::OrderedSet.new([original_entry]) }

  context 'with the same ordered_set' do

    let(:other) { ordered_set }

    it { should be(true) }

    it 'is symmetric' do
      should == other.eql?(ordered_set)
    end
  end

  context 'with equivalent ordered_set' do

    let(:other) { ordered_set.dup }

    it { should be(true) }

    it 'is symmetric' do
      should == other.eql?(ordered_set)
    end
  end

  context 'with both containing no ordered_set' do

    let(:ordered_set) { DataObjects::Schema::OrderedSet.new }
    let(:other)  { DataObjects::Schema::OrderedSet.new }

    it { should be(true) }

    it 'is symmetric' do
      should == other.eql?(ordered_set)
    end
  end

  context 'with different ordered_set' do

    let(:different_entry) { 2                                                      }
    let(:other)           { DataObjects::Schema::OrderedSet.new([different_entry]) }

    it { should be(false) }

    it 'is symmetric' do
      should == other.eql?(ordered_set)
    end

  end

end

