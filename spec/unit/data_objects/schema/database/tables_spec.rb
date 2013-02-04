require 'spec_helper'
require 'do-schema/database'

describe 'DataObjects::Schema::Database#tables' do

  context 'when no tables were passed at construction time' do

    subject { database.tables }

    let(:name)     { 'foo' }
    let(:uri)      { mock(:uri) }

    let(:database) { DataObjects::Schema::Database.new(name, uri) }

    it { should be_instance_of(DataObjects::Schema::Tables) }
    it { should == DataObjects::Schema::Tables.new([]) }

  end

  context 'when an array was passed at construction time' do

    subject { database.tables }

    let(:name)     { 'foo' }
    let(:uri)      { mock(:uri) }

    let(:database) { DataObjects::Schema::Database.new(name, uri, []) }

    it { should be_instance_of(DataObjects::Schema::Tables) }
    it { should == DataObjects::Schema::Tables.new([]) }

  end

  context 'when a Tables instance was passed at construction time' do

    subject { database.tables }

    let(:name)     { 'foo' }
    let(:uri)      { mock(:uri) }
    let(:tables)   { DataObjects::Schema::Tables.new([]) }

    let(:database) { DataObjects::Schema::Database.new(name, uri, tables) }

    it { should be_instance_of(DataObjects::Schema::Tables) }
    it { should == tables }

  end

end
