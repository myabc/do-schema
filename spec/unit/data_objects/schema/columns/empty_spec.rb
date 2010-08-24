require 'spec_helper'
require 'do-schema/column'
require 'spec/unit/data_objects/schema/collection/empty_spec'

describe 'DataObjects::Schema::Columns#empty?' do

  subject { columns.empty? }

  let(:columns) { collection }

  context 'with no entries' do

    let(:collection) { DataObjects::Schema::Columns.new }

    it_should_behave_like 'DataObjects::Schema::Collection#empty? with no entries in it'

  end

  context 'with entries' do

    let(:entry)      { DataObjects::Schema::Column.new('name', {}) }
    let(:collection) { DataObjects::Schema::Columns.new([entry] )  }

    it_should_behave_like 'DataObjects::Schema::Collection#empty? with entries in it'

  end

end

