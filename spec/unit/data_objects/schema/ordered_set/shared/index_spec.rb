require 'spec_helper'
require 'do-schema/support/ordered_set'

shared_examples_for 'DataObjects::Schema::OrderedSet#index when the entry is not present' do

  subject { ordered_set.index(entry) }

  it { should be(nil) }

end

shared_examples_for 'DataObjects::Schema::OrderedSet#index when 1 entry is present' do

  subject { ordered_set.index(entry) }

  it { should == 0 }

end

shared_examples_for 'DataObjects::Schema::OrderedSet#index when 2 entries are present' do

  subject { ordered_set.index(entry) }

  it { should == 1 }

end

