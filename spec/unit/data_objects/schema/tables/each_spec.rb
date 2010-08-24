require 'spec_helper'
require 'do-schema/table'
require 'spec/unit/data_objects/schema/collection/each_spec'

describe 'DataObjects::Schema::Tables' do

  subject { DataObjects::Schema::Tables.new }

  it_should_behave_like 'DataObjects::Schema::Collection'

end

describe 'DataObjects::Schema::Tables#each' do

  subject { tables.each { |entry| yields << entry } }

  let(:tables)     { collection                               }

  let(:collection) { DataObjects::Schema::Tables.new([table]) }
  let(:table)      { entry                                    }
  let(:entry)      { DataObjects::Schema::Table.new('name')   }
  let(:yields)     { []                                       }

  it_should_behave_like 'DataObjects::Schema::Collection#each'

end

