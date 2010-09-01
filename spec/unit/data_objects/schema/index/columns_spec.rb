require 'spec_helper'
require 'spec/unit/data_objects/schema/index/shared/columns_spec'

require 'do-schema/index'

describe 'DataObjects::Schema::Index#columns' do

  subject { index.columns }

  let(:index)   { DataObjects::Schema::Index.new(name, columns) }

  let(:name)    { 'index'                                       }
  let(:column)  { DataObjects::Schema::Column.new('column', {}) }
  let(:columns) { DataObjects::Schema::Columns.new([column])    }

  it_should_behave_like 'DataObjects::Schema::Index#columns'

end

