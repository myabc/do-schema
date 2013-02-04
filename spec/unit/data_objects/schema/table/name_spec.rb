require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Table#name' do

  subject { table.name }

  let(:name)  { 'foo' }
  let(:table) { DataObjects::Schema::Table.new(name) }

  it { should == name }

end
