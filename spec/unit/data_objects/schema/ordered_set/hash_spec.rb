require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#hash' do

  subject { ordered_set.hash }

  let(:entry)       { 1                                            }
  let(:ordered_set) { DataObjects::Schema::OrderedSet.new([entry]) }

  it { should be_kind_of(Integer) }

  it { should == ordered_set.entries.hash }

end
