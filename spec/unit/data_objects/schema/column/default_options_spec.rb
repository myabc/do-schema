require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Column#default_options' do

  subject { column.default_options }

  let(:column) { DataObjects::Schema::Column.new('name', {}) }
  let(:default_options) { { :required => true } }

  it { should == default_options }

end
