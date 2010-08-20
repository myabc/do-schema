require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Columns' do

  subject { DataObjects::Schema::Columns.new }

  it { should be_kind_of(Enumerable) }

  it 'case matches Enumerable' do
    (Enumerable === subject).should be(true)
  end
end

describe 'DataObjects::Schema::Columns#each' do

  subject { columns.each { |column| yields << column } }

  let(:columns) { DataObjects::Schema::Columns.new([column])  }
  let(:column)  { DataObjects::Schema::Column.new('name', {}) }
  let(:yields)  { []                                          }

  it { should equal(columns) }

  it 'yields each column' do
    expect { subject }.to change { yields.dup }.from([]).to([column])
  end
end


