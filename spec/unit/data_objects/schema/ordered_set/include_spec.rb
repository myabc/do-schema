require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/ordered_set/shared/include_spec'

describe 'DataObjects::Schema::OrderedSet#include?' do

  subject { ordered_set.include?(entry) }

  let(:ordered_set) { set }

  context 'when the entry is present' do

    let(:set)   { DataObjects::Schema::OrderedSet.new([entry]) }
    let(:entry) { 1                                            }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#include? when the entry is present'

  end

  context 'when the entry is not present' do

    let(:set)   { DataObjects::Schema::OrderedSet.new }
    let(:entry) { 1                                   }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#include? when the entry is not present'

  end

end

