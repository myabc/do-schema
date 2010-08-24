require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/collection/append_spec'

shared_examples_for 'DataObjects::Schema::OrderedSet#<< when appending an already included entry' do

  it_should_behave_like 'DataObjects::Schema::Collection#<< when appending an already included entry'

  it 'should not alter the position of the existing entry' do
    subject.index(entry1).should == collection.entries.length - 1
  end

  it 'does not add an entry to the collection' do
    expect { subject }.to_not change { subject.length }
  end

end

shared_examples_for 'DataObjects::Schema::OrderedSet#<< when appending a not yet included entry' do

  it_should_behave_like 'DataObjects::Schema::Collection#<< when appending a not yet included entry'

  it 'should not alter the position of the existing entry' do
    subject.index(entry1).should == collection.entries.length - 2
  end

  it 'should append columns at the end of the collection' do
    subject.index(entry2).should == collection.entries.length - 1
  end

end

