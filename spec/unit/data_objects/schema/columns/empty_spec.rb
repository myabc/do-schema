require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Columns#empty?' do

  subject { columns.empty? }

  let(:columns) { set }

  context 'with no entries' do

    let(:set) { DataObjects::Schema::Columns.new }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#empty? with no entries in it'

  end

  context 'with entries' do

    let(:set)   { DataObjects::Schema::Columns.new([entry] )  }
    let(:entry) { DataObjects::Schema::Column.new('name', {}) }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#empty? with entries in it'

  end

end
