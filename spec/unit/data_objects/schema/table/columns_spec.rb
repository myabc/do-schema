require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Table#columns' do

  context 'with no columns given at construction time' do

    subject { table.columns }

    let(:table) { DataObjects::Schema::Table.new('name') }

    it { should be_instance_of(DataObjects::Schema::Columns) }
    it { should == DataObjects::Schema::Columns.new([]) }

  end

  context 'with an array of columns at construction time' do

    subject { table.columns }

    let(:table) { DataObjects::Schema::Table.new('name', []) }

    it { should be_instance_of(DataObjects::Schema::Columns) }
    it { should == DataObjects::Schema::Columns.new([]) }

  end

end
