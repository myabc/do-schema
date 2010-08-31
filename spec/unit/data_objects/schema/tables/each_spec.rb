require 'spec_helper'
require 'do-schema/table'
require 'spec/unit/data_objects/schema/ordered_set/shared/each_spec'

describe 'DataObjects::Schema::Tables' do

  subject { DataObjects::Schema::Tables.new }

  it_should_behave_like 'DataObjects::Schema::OrderedSet'

end

describe 'DataObjects::Schema::Tables#each' do

  subject { tables.each { |entry| yields << entry } }

  let(:tables) { set                                      }

  let(:set)    { DataObjects::Schema::Tables.new([table]) }
  let(:table)  { entry                                    }
  let(:entry)  { DataObjects::Schema::Table.new('name')   }
  let(:yields) { []                                       }

  it_should_behave_like 'DataObjects::Schema::OrderedSet#each'

end

