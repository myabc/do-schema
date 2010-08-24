require 'spec_helper'
require 'do-schema/table'
require 'spec/unit/data_objects/schema/collection/empty_spec'

describe 'DataObjects::Schema::Tables#empty?' do

  subject { tables.empty? }

  let(:tables) { collection }

  context 'with no entries' do

    let(:collection) { DataObjects::Schema::Tables.new }

    it_should_behave_like 'DataObjects::Schema::Collection#empty? with no entries in it'

  end

  context 'with entries' do

    let(:collection) { DataObjects::Schema::Tables.new([table])   }
    let(:table)      { entry                                      }
    let(:entry)      { DataObjects::Schema::Table.new('name', {}) }

    it_should_behave_like 'DataObjects::Schema::Collection#empty? with entries in it'

  end

end

