require 'spec_helper'
require 'do-schema/database'

describe 'DataObjects::Schema::Database#empty?' do

  context 'with no tables in it' do

    subject { database.empty? }

    let(:name)     { 'name' }
    let(:uri)      { mock(:uri) }

    let(:database) { DataObjects::Schema::Database.new(name, uri, []) }

    it { should be(true) }

  end

  context 'with tables in it' do

    subject { database.empty? }

    let(:name)     { 'name' }
    let(:uri)      { mock(:uri) }
    let(:tables)   { [DataObjects::Schema::Table.new('name', [])] }

    let(:database) { DataObjects::Schema::Database.new(name, uri, tables) }

    it { should be(false) }

  end

end
