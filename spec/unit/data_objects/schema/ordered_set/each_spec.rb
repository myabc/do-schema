require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet' do

  subject { DataObjects::Schema::OrderedSet.new }

  it { should be_kind_of(Enumerable) }

  it 'case matches Enumerable' do
    (Enumerable === subject).should be(true)
  end
end

describe 'DataObjects::Schema::OrderedSet#each' do

  subject { ordered_set.each { |entry| yields << entry } }

  let(:entry)       { 1                                            }
  let(:ordered_set) { DataObjects::Schema::OrderedSet.new([entry]) }
  let(:yields)      { []                                           }

  it { should equal(ordered_set) }

  it 'yields each entry' do
    expect { subject }.to change { yields.dup }.from([]).to([entry])
  end
end

