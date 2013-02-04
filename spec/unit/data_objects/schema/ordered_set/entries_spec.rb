require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#entries' do

  subject { ordered_set.entries }

  let(:ordered_set) { set }

  context 'with no entries' do

    let(:set) { DataObjects::Schema::OrderedSet.new }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#entries with no entries'

  end

  context 'with entries' do

    let(:set)   { DataObjects::Schema::Columns.new([entry]) }
    let(:entry) { 1                                         }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#entries with entries'

  end

end
