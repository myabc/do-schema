require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Column#default' do

  subject { column.default }

  let(:default) { 'foo' }
  let(:options) {{ :default => default }}
  let(:column)  { DataObjects::Schema::Column.new('name', options) }

  it { should == default }

end
