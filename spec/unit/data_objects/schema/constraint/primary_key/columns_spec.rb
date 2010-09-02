require 'spec_helper'
require 'spec/unit/data_objects/schema/index/shared/columns_spec'

require 'do-schema/constraint'

describe 'DataObjects::Schema::Constraint::PrimaryKey#columns' do

  subject { primary_key.columns }

  let(:primary_key) { DataObjects::Schema::Constraint::PrimaryKey.new(name, columns) }
  let(:name)        { 'primary_key'                                      }
  let(:columns)     { DataObjects::Schema::Columns.new([column])         }
  let(:column)      { DataObjects::Schema::Column.new('column', {})      }

  it_should_behave_like 'DataObjects::Schema::Index#columns'

end

