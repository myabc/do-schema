require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Table' do

  subject { DataObjects::Schema::Table.new('name', []) }

  it { should be_kind_of(Enumerable) }

  it 'case matches Enumerable' do
    (Enumerable === subject).should be(true)
  end
end

describe 'DataObjects::Schema::Table#each' do

  subject { table.each { |column| yields << column } }

  let(:table)  { DataObjects::Schema::Table.new('name', [column]) }
  let(:column) { DataObjects::Schema::Column.new('name', {})      }
  let(:yields) { []                                               }

  it { should equal(table) }

  it 'yields each column' do
    expect { subject }.to change { yields.dup }.from([]).to([column])
  end
end
