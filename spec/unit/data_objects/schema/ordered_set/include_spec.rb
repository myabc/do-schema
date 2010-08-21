require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#include?' do

  subject { ordered_set.include?(entry) }

  context 'when the entry is present' do

    let(:entry)       { 1 }
    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([entry]) }

    it { should be(true) }

  end

  context 'when the entry is not present' do

    let(:entry)       { 1 }
    let(:ordered_set) { DataObjects::Schema::OrderedSet.new }

    it { should be(false) }

  end

end

