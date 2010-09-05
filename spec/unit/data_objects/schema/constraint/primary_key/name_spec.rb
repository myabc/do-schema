require 'spec_helper'
require 'spec/unit/data_objects/schema/constraint/table_constraint/name_spec'

require 'do-schema/constraint'

describe 'DataObjects::Schema::Constraint::PrimaryKey#name' do

  subject { primary_key.name }

  let(:primary_key) { DataObjects::Schema::Constraint::PrimaryKey.new(name, columns) }
  let(:name)        { 'primary_key'                                                  }
  let(:columns)     { DataObjects::Schema::Columns.new([column])                     }
  let(:column)      { DataObjects::Schema::Column.new('column', {})                  }

  it_should_behave_like 'DataObjects::Schema::Constraint::TableConstraint#name'

end

