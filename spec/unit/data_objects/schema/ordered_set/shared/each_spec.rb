require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/set/each_spec'

shared_examples_for 'DataObjects::Schema::OrderedSet' do

  it_should_behave_like 'DataObjects::Schema::Set'

end

shared_examples_for 'DataObjects::Schema::OrderedSet#each' do

  it_should_behave_like 'DataObjects::Schema::Set#each'

end

