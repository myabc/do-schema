require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet' do

  subject { DataObjects::Schema::OrderedSet.new }

  it_should_behave_like 'DataObjects::Schema::OrderedSet'

end

describe 'DataObjects::Schema::OrderedSet#each' do

  subject { set.each { |entry| yields << entry } }

  let(:set)    { DataObjects::Schema::OrderedSet.new([entry]) }
  let(:entry)  { 1                                            }
  let(:yields) { []                                           }

  it_should_behave_like 'DataObjects::Schema::OrderedSet#each'

end
