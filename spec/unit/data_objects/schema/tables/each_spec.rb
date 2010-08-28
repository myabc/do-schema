require 'spec_helper'
require 'do-schema/table'
require 'spec/unit/data_objects/schema/set/each_spec'

describe 'DataObjects::Schema::Tables' do

  subject { DataObjects::Schema::Tables.new }

  it_should_behave_like 'DataObjects::Schema::Set'

end

describe 'DataObjects::Schema::Tables#each' do

  subject { tables.each { |entry| yields << entry } }

  let(:tables) { set                                      }

  let(:set)    { DataObjects::Schema::Tables.new([table]) }
  let(:table)  { entry                                    }
  let(:entry)  { DataObjects::Schema::Table.new('name')   }
  let(:yields) { []                                       }

  it_should_behave_like 'DataObjects::Schema::Set#each'

end

