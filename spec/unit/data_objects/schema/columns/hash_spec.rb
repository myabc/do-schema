require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Columns#hash' do

  subject { columns.hash }

  let(:column)   { DataObjects::Schema::Column.new('name', {}) }
  let(:columns)  { DataObjects::Schema::Columns.new([column])  }

  it { should be_kind_of(Integer) }

  it { should == columns.entries.hash }

end
