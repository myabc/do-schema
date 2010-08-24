require 'spec_helper'
require 'do-schema/table'
require 'spec/unit/data_objects/schema/collection/entries_spec'

describe 'DataObjects::Schema::Tables#entries' do

  subject { tables.entries }

  let(:tables) { collection }

  context 'with no entries' do

    let(:collection) { DataObjects::Schema::Tables.new }

    it_should_behave_like 'DataObjects::Schema::Collection#entries with no entries'

  end

  context 'with entries' do

    let(:collection) { DataObjects::Schema::Tables.new([table]) }
    let(:table)      { entry                                    }
    let(:entry)      { DataObjects::Schema::Table.new('name')   }

    it_should_behave_like 'DataObjects::Schema::Collection#entries with entries'

  end

end

