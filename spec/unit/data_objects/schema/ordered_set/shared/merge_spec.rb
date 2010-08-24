require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/collection/merge_spec'

shared_examples_for 'DataObjects::Schema::OrderedSet#merge when merging two empty collections' do

  it_should_behave_like 'DataObjects::Schema::Collection#merge when merging two empty collections'

end

shared_examples_for 'DataObjects::Schema::OrderedSet#merge when merging a collection with already present entries' do

  it_should_behave_like 'DataObjects::Schema::Collection#merge when merging a collection with already present entries'

end

shared_examples_for 'DataObjects::Schema::OrderedSet#merge when merging a collection with not yet present entries' do

  it_should_behave_like 'DataObjects::Schema::Collection#merge when merging a collection with not yet present entries'

end

