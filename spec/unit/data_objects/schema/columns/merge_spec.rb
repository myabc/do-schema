require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Columns#merge' do

  context 'when merging an empty collection' do

    subject { columns.merge([]) }

    let(:columns) { DataObjects::Schema::Columns.new }

    it { should be_instance_of(columns.class) }
    it { should_not equal(columns)            }

    it { should be_empty }

  end

  context 'when merging a collection with entries' do

    subject { columns.merge([column]) }

    let(:column)  { DataObjects::Schema::Column.new('name', {}) }
    let(:columns) { DataObjects::Schema::Columns.new([column])  }

    it { should be_instance_of(columns.class) }
    it { should_not equal(columns)            }

    it { should include(column) }

  end

end

