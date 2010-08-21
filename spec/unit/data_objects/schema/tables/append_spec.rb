require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Tables#<<' do

  subject { tables << table }

  let(:table)  { DataObjects::Schema::Table.new('name') }
  let(:tables) { DataObjects::Schema::Tables.new        }

  its(:entries) { should include(table) }

end

