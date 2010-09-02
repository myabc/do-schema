require 'spec_helper'
require 'do-schema/reference'

describe 'DataObjects::Schema::Reference#columns' do

  subject { reference.columns }

  let(:reference) { DataObjects::Schema::Reference.new(table, columns) }
  let(:table)     { DataObjects::Schema::Table.new('table')            }
  let(:columns)   { DataObjects::Schema::Columns.new([column])         }
  let(:column)    { DataObjects::Schema::Column.new('column', {})      }

  it { should == columns }

end

