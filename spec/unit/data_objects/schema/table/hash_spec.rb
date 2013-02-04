require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Table#hash' do

  subject { table.hash }

  let(:name)     { 'name'                                        }
  let(:column)   { DataObjects::Schema::Column.new(name, {})     }
  let(:columns)  { DataObjects::Schema::Columns.new([column])    }

  let(:table)    { DataObjects::Schema::Table.new(name, columns) }

  it { should be_kind_of(Integer) }

  it { should == name.hash ^ columns.entries.hash }

end
