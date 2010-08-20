require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Tables' do

  subject { DataObjects::Schema::Tables.new }

  it { should be_kind_of(Enumerable) }

  it 'case matches Enumerable' do
    (Enumerable === subject).should be(true)
  end
end

describe 'DataObjects::Schema::Tables#each' do

  subject { tables.each { |table| yields << table } }

  let(:tables) { DataObjects::Schema::Tables.new([table]) }
  let(:table)  { DataObjects::Schema::Table.new('name')   }
  let(:yields) { []                                       }

  it { should equal(tables) }

  it 'yields each table' do
    expect { subject }.to change { yields.dup }.from([]).to([table])
  end
end

