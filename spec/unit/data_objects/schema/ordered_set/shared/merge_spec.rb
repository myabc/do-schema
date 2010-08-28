require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/set/merge_spec'

shared_examples_for 'DataObjects::Schema::OrderedSet#merge when merging two empty sets' do

  it_should_behave_like 'DataObjects::Schema::Set#merge when merging two empty sets'

end

shared_examples_for 'DataObjects::Schema::OrderedSet#merge when merging a set with already present entries' do

  it_should_behave_like 'DataObjects::Schema::Set#merge when merging a set with already present entries'

end

shared_examples_for 'DataObjects::Schema::OrderedSet#merge when merging a set with not yet present entries' do

  it_should_behave_like 'DataObjects::Schema::Set#merge when merging a set with not yet present entries'

end

