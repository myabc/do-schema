require 'spec_helper'
require 'do-schema/support/ordered_set'
require 'spec/unit/data_objects/schema/collection/include_spec'

describe 'DataObjects::Schema::OrderedSet#include?' do

  subject { ordered_set.include?(entry) }

  let(:ordered_set) { collection }

  context 'when the entry is present' do

    let(:entry)      { 1 }
    let(:collection) { DataObjects::Schema::OrderedSet.new([entry]) }

    it_should_behave_like 'DataObjects::Schema::Collection#include? when the entry is present'

  end

  context 'when the entry is not present' do

    let(:entry)      { 1 }
    let(:collection) { DataObjects::Schema::OrderedSet.new }

    it_should_behave_like 'DataObjects::Schema::Collection#include? when the entry is not present'

  end

end

