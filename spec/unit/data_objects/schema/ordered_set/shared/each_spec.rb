require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/collection/each_spec'

shared_examples_for 'DataObjects::Schema::OrderedSet' do

  it_should_behave_like 'DataObjects::Schema::Collection'

end

shared_examples_for 'DataObjects::Schema::OrderedSet#each' do

  let(:entry)      { 1                                            }
  let(:collection) { DataObjects::Schema::OrderedSet.new([entry]) }

  it_should_behave_like 'DataObjects::Schema::Collection#each'

end

