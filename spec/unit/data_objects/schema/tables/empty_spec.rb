require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Tables#empty?' do

  context 'with no tables in it' do

    subject { tables.empty? }

    let(:tables) { DataObjects::Schema::Tables.new }

    it { should be(true) }

  end

  context 'with tables in it' do

    subject { tables.empty? }

    let(:table)  { DataObjects::Schema::Table.new('name')    }
    let(:tables) { DataObjects::Schema::Tables.new([table])  }

    it { should be(false) }

  end

end

