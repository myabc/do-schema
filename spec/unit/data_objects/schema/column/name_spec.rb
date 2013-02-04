require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Column#name' do

  subject { column.name }

  let(:name)   { 'foo' }
  let(:column) { DataObjects::Schema::Column.new(name, {}) }

  it { should == name }

end
