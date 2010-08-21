require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#<<' do

  subject { ordered_set << entry2 }

  let(:entry1)      { 1                                             }
  let(:ordered_set) { DataObjects::Schema::OrderedSet.new([entry1]) }

  context 'when appending an already included entry' do

    let(:entry2)  { 1 }

    its(:length)  { should == 1            }
    its(:entries) { should include(entry1) }
    its(:entries) { should include(entry2) }

    it 'should not alter the position of the existing entry' do
      subject.index(entry1).should == ordered_set.entries.length - 1
    end

    it 'does not add an entry to the collection' do
      expect { subject }.to_not change { subject.length }
    end

  end

  context 'when appending a not yet included entry' do

    let(:entry2)  { 2 }

    let(:ordered_set)  { DataObjects::Schema::OrderedSet.new([entry1]) }

    its(:length)  { should == 2            }
    its(:entries) { should include(entry1) }
    its(:entries) { should include(entry2) }

    it 'should not alter the position of the existing entry' do
      subject.index(entry1).should == ordered_set.entries.length - 2
    end

    it 'should append columns at the end of the collection' do
      subject.index(entry2).should == ordered_set.entries.length - 1
    end

    it 'adds an entry to the collection' do
      expect { subject }.to change { ordered_set.length }.from(1).to(2)
    end

  end

end

