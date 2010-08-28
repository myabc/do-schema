require 'spec_helper'
require 'do-schema/column'
require 'spec/unit/data_objects/schema/set/include_spec'

describe 'DataObjects::Schema::Columns#include?' do

  subject { columns.include?(column) }

  let(:columns) { set                                         }
  let(:column)  { entry                                       }
  let(:entry)   { DataObjects::Schema::Column.new('name', {}) }

  context 'when the entry is present' do

    let(:set) { DataObjects::Schema::Columns.new([entry]) }

    it_should_behave_like 'DataObjects::Schema::Set#include? when the entry is present'

  end

  context 'when the entry is not present' do

    let(:set) { DataObjects::Schema::Columns.new }

    it_should_behave_like 'DataObjects::Schema::Set#include? when the entry is not present'

  end

end

