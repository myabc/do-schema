require 'spec_helper'
require 'spec/unit/data_objects/schema/index/shared/initialize_spec'

require 'do-schema/index'

describe 'DataObjects::Schema::Index#initialize' do

  subject { DataObjects::Schema::Index.new(name, columns) }

  let(:name)    { 'index'                                       }
  let(:column)  { DataObjects::Schema::Column.new('column', {}) }
  let(:columns) { DataObjects::Schema::Columns.new([column])    }

  it_should_behave_like 'DataObjects::Schema::Index#initialize'

  it { should_not be_unique }

end

