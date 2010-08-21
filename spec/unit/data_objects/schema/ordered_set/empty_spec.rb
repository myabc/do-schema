require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#empty?' do

  subject { ordered_set.empty? }

  context 'with no entries in it' do

    let(:ordered_set) { DataObjects::Schema::OrderedSet.new }

    it { should be(true) }

  end

  context 'with entries in it' do

    let(:entry)       { 1                                            }
    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([entry]) }

    it { should be(false) }

  end

end

