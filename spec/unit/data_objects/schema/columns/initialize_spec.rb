require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Columns#initialize' do

  context 'when no columns are given' do

    subject { DataObjects::Schema::Columns.new }

    its(:entries) { should be_empty }

  end

  context 'when columns are given' do

    subject { DataObjects::Schema::Columns.new([column]) }

    let(:column)  { DataObjects::Schema::Column.new('name', {}) }

    its(:entries) { should include(column) }

  end

end

