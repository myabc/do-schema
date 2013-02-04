require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Tables#hash' do

  subject { tables.hash }

  let(:table)  { DataObjects::Schema::Table.new('name')   }
  let(:tables) { DataObjects::Schema::Tables.new([table]) }

  it { should be_kind_of(Integer) }

  it { should == tables.entries.hash }

end
