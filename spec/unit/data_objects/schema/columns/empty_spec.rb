require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Columns#empty?' do

  context 'with no columns in it' do

    subject { columns.empty? }

    let(:columns) { DataObjects::Schema::Columns.new }

    it { should be(true) }

  end

  context 'with columns in it' do

    subject { columns.empty? }

    let(:column)  { DataObjects::Schema::Column.new('name', {}) }
    let(:columns) { DataObjects::Schema::Columns.new([column])  }

    it { should be(false) }

  end

end

