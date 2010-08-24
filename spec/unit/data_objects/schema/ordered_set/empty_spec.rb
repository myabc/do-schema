require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/collection/empty_spec'

describe 'DataObjects::Schema::OrderedSet#empty?' do

  subject { collection.empty? }

  context 'with no entries in it' do

    let(:collection) { DataObjects::Schema::OrderedSet.new }

    it_should_behave_like 'DataObjects::Schema::Collection#empty? with no entries in it'

  end

  context 'with entries in it' do

    let(:entry)      { 1                                            }
    let(:collection) { DataObjects::Schema::OrderedSet.new([entry]) }

    it_should_behave_like 'DataObjects::Schema::Collection#empty? with entries in it'
  end

end

