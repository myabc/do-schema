require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#<<' do

  subject { set << entry2 }

  let(:entry1) { 1                                             }
  let(:set)    { DataObjects::Schema::OrderedSet.new([entry1]) }

  context 'when appending an already included entry' do

    let(:entry2) { 1 }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#<< when appending an already included entry'

  end

  context 'when appending a not yet included entry' do

    let(:entry2) { 2 }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#<< when appending a not yet included entry'

  end

end
