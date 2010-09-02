require 'spec_helper'
require 'do-schema/reference'

describe 'DataObjects::Schema::Reference#initialize' do

  context 'when columns are not defined within table' do
    it { pending }
  end

  context 'when columns are defined within table' do

    subject { DataObjects::Schema::Reference.new(table, columns) }

    let(:table)   { DataObjects::Schema::Table.new('table')       }
    let(:columns) { DataObjects::Schema::Columns.new([column])    }
    let(:column)  { DataObjects::Schema::Column.new('column', {}) }

    its(:table)   { should == table   }
    its(:columns) { should == columns }

  end

end

