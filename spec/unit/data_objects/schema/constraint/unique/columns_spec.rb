require 'spec_helper'
require 'spec/unit/data_objects/schema/constraint/table_constraint/columns_spec'

require 'do-schema/constraint'

describe 'DataObjects::Schema::Constraint::Unique#columns' do

  subject { unique_index.columns }

  let(:unique_index) { DataObjects::Schema::Constraint::Unique.new(name, columns) }
  let(:name)         { 'unique_index'                                             }
  let(:columns)      { DataObjects::Schema::Columns.new([column])                 }
  let(:column)       { DataObjects::Schema::Column.new('column', {})              }

  it_should_behave_like 'DataObjects::Schema::Constraint::TableConstraint#columns'

end

