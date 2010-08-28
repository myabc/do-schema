require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/set/empty_spec'

describe 'DataObjects::Schema::OrderedSet#empty?' do

  subject { set.empty? }

  context 'with no entries in it' do

    let(:set) { DataObjects::Schema::OrderedSet.new }

    it_should_behave_like 'DataObjects::Schema::Set#empty? with no entries in it'

  end

  context 'with entries in it' do

    let(:set)   { DataObjects::Schema::OrderedSet.new([entry]) }
    let(:entry) { 1                                            }

    it_should_behave_like 'DataObjects::Schema::Set#empty? with entries in it'
  end

end

