require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Tables#entries' do

  context 'with no entries' do

    subject { tables.entries }

    let(:tables) { DataObjects::Schema::Tables.new }

    it { should be_empty }

  end

  context 'with entries' do

    subject { tables.entries }

    let(:table)  { DataObjects::Schema::Table.new('name')   }
    let(:tables) { DataObjects::Schema::Tables.new([table]) }

    it { should include(table) }

  end

end



