require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Column#options' do

  subject { column.options }

  let(:options) { { :foo => :bar } }
  let(:column)  { DataObjects::Schema::Column.new('name', options) }

  it { should == column.default_options.merge(options) }

end

