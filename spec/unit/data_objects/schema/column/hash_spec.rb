require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Column#hash' do

  subject { column.hash }

  let(:name)    { 'name' }
  let(:options) { { :default => 'foo', :required => true } }
  let(:column)  { DataObjects::Schema::Column.new(name, options) }

  it { should be_kind_of(Integer) }

  it { should == column.name.hash ^ column.default.hash ^ column.required?.hash }

end
