require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Tables#merge' do

  context 'when merging an empty collection' do

    subject { tables.merge([]) }

    let(:tables) { DataObjects::Schema::Tables.new }

    it { should be_instance_of(tables.class) }
    it { should_not equal(tables)            }

    it { should be_empty }

  end

  context 'when merging a collection with entries' do

    subject { tables.merge([table]) }

    let(:table)  { DataObjects::Schema::Table.new('name')   }
    let(:tables) { DataObjects::Schema::Tables.new([table]) }

    it { should be_instance_of(tables.class) }
    it { should_not equal(tables)            }

    it { should include(table) }

  end

end

