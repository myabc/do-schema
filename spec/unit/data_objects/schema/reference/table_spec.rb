require 'spec_helper'
require 'do-schema/reference'

describe 'DataObjects::Schema::Reference#table' do

  subject { reference.table }

  let(:reference) { DataObjects::Schema::Reference.new(table, columns) }
  let(:table)     { DataObjects::Schema::Table.new('table')            }
  let(:columns)   { DataObjects::Schema::Columns.new([column])         }
  let(:column)    { DataObjects::Schema::Column.new('column', {})      }

  it { should == table }

end

