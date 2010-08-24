require 'spec_helper'
require 'do-schema/column'
require 'spec/unit/data_objects/schema/ordered_set/shared/each_spec'

describe 'DataObjects::Schema::Columns' do

  subject { DataObjects::Schema::Columns.new }

  it_should_behave_like 'DataObjects::Schema::OrderedSet'

end

describe 'DataObjects::Schema::Columns#each' do

  subject { columns.each { |entry| yields << entry } }

  let(:columns)    { collection }

  let(:collection) { DataObjects::Schema::Columns.new([entry])   }
  let(:entry)      { DataObjects::Schema::Column.new('name', {}) }
  let(:yields)     { []                                          }

  it_should_behave_like 'DataObjects::Schema::OrderedSet#each'

end

