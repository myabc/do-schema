require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Columns#entries' do

  context 'with no entries' do

    subject { columns.entries }

    let(:columns) { DataObjects::Schema::Columns.new }

    it { should be_empty }

  end

  context 'with entries' do

    subject { columns.entries }

    let(:column)  { DataObjects::Schema::Column.new('name', {}) }
    let(:columns) { DataObjects::Schema::Columns.new([column])  }

    it { should include(column) }

  end

end


