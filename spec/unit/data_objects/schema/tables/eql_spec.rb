require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Tables#eql?' do

  subject { tables.eql?(other) }

  let(:original_table)  { DataObjects::Schema::Table.new('name')            }
  let(:tables)          { DataObjects::Schema::Tables.new([original_table]) }

  context 'with the same tables' do

    let(:other) { tables }

    it { should be(true) }

    it 'is symmetric' do
      should == other.eql?(tables)
    end
  end

  context 'with equivalent tables' do

    let(:other) { tables.dup }

    it { should be(true) }

    it 'is symmetric' do
      should == other.eql?(tables)
    end
  end

  context 'with both containing no tables' do

    let(:tables) { DataObjects::Schema::Tables.new }
    let(:other)  { DataObjects::Schema::Tables.new }

    it { should be(true) }

    it 'is symmetric' do
      should == other.eql?(tables)
    end
  end

  context 'with different tables' do

    let(:different_table) { DataObjects::Schema::Table.new('different')        }
    let(:other)           { DataObjects::Schema::Tables.new([different_table]) }

    it { should be(false) }

    it 'is symmetric' do
      should == other.eql?(tables)
    end

  end

end

