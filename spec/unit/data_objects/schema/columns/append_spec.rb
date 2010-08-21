require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Columns#<<' do

  subject { columns << column }

  let(:column)  { DataObjects::Schema::Column.new('name', {}) }
  let(:columns) { DataObjects::Schema::Columns.new            }

  its(:columns) { should include(column) }

end

