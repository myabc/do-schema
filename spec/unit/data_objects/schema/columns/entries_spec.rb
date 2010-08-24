require 'spec_helper'
require 'do-schema/column'
require 'spec/unit/data_objects/schema/collection/entries_spec'

describe 'DataObjects::Schema::Columns#entries' do

  subject { columns.entries }

  let(:columns) { collection }

  context 'with no entries' do

    let(:collection) { DataObjects::Schema::Columns.new }

    it_should_behave_like 'DataObjects::Schema::Collection#entries with no entries'

  end

  context 'with entries' do

    let(:entry)      { DataObjects::Schema::Column.new('name', {}) }
    let(:collection) { DataObjects::Schema::Columns.new([entry])   }

    it_should_behave_like 'DataObjects::Schema::Collection#entries with entries'

  end

end

