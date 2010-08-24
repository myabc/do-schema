require 'spec_helper'
require 'do-schema/column'
require 'spec/unit/data_objects/schema/collection/length_spec'

describe 'DataObjects::Schema::Columns#length' do

  subject { columns.length }

  context 'when no entry is present' do

    let(:columns) { DataObjects::Schema::Columns.new              }

    it_should_behave_like 'DataObjects::Schema::Collection#length when no entry is present'

  end

  context 'when 1 entry is present' do

    let(:columns) { DataObjects::Schema::Columns.new([entry]) }

    let(:entry)   { DataObjects::Schema::Column.new('column', {}) }

    it_should_behave_like 'DataObjects::Schema::Collection#length when 1 entry is present'

  end

  context 'when more than 1 entry is present' do

    let(:columns) { DataObjects::Schema::Columns.new(entries)      }

    let(:entries) { [entry1, entry2]                               }

    let(:entry1)  { DataObjects::Schema::Column.new('column1', {}) }
    let(:entry2)  { DataObjects::Schema::Column.new('column2', {}) }

    let(:expected_length) { entries.length                         }

    it_should_behave_like 'DataObjects::Schema::Collection#length when more than 1 entry is present'

  end

end

