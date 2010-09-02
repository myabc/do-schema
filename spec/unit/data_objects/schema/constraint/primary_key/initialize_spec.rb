require 'spec_helper'
require 'spec/unit/data_objects/schema/index/shared/initialize_spec'

require 'do-schema/constraint'

describe 'DataObjects::Schema::Constraint::PrimaryKey#initialize' do

  subject { DataObjects::Schema::Constraint::PrimaryKey.new(name, columns) }

  let(:name)    { 'primary_key'                                 }
  let(:columns) { DataObjects::Schema::Columns.new([column])    }
  let(:column)  { DataObjects::Schema::Column.new('column', {}) }

  it_should_behave_like 'DataObjects::Schema::Index#initialize'

  it { should be_unique }

end

