require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/set/initialize_spec'

shared_examples_for 'DataObjects::Schema::OrderedSet#initialize when no entries are given' do

  it_should_behave_like 'DataObjects::Schema::Set#initialize when no entries are given'

end

shared_examples_for 'DataObjects::Schema::OrderedSet#initialize when entries are given and they do not contain duplicates' do

  it_should_behave_like 'DataObjects::Schema::Set#initialize when entries are given and they do not contain duplicates'

  it 'should retain insertion order' do
    subject.index(entry1).should == 0
    subject.index(entry2).should == 1
  end

end

shared_examples_for 'DataObjects::Schema::OrderedSet#initialize when entries are given and they contain duplicates' do

  it_should_behave_like 'DataObjects::Schema::Set#initialize when entries are given and they contain duplicates'

end

