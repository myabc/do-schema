require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#merge' do

  context 'when merging an empty collection' do

    subject { ordered_set.merge([]) }

    let(:ordered_set) { DataObjects::Schema::OrderedSet.new }

    it { should be_empty }

    it 'does not add entries to the collection' do
      expect { subject }.to_not change { ordered_set.length }
    end

  end

  context 'when merging a collection with already present entries' do

    subject { ordered_set.merge([entry]) }

    let(:entry)       { 1                                            }
    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([entry]) }

    it { should include(entry) }

    it 'does not add an entry to the collection' do
      expect { subject }.to_not change { ordered_set.length }
    end

  end

  context 'when merging a collection with not yet present entries' do

    subject { ordered_set.merge([entry2]) }

    let(:entry1)      { 1                                             }
    let(:entry2)      { 2                                             }
    let(:ordered_set) { DataObjects::Schema::OrderedSet.new([entry1]) }

    it { should include(entry1) }
    it { should include(entry2) }

    it 'adds an entry to the collection' do
      expect { subject }.to change { ordered_set.length }.from(1).to(2)
    end

  end

end

