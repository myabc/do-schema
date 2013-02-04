require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Tables#entries' do

  subject { tables.entries }

  let(:tables) { set }

  context 'with no entries' do

    let(:set) { DataObjects::Schema::Tables.new }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#entries with no entries'

  end

  context 'with entries' do

    let(:set)   { DataObjects::Schema::Tables.new([table]) }
    let(:table) { entry                                    }
    let(:entry) { DataObjects::Schema::Table.new('name')   }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#entries with entries'

  end

end
