require 'spec_helper'
require 'do-schema/table'
require 'spec/unit/data_objects/schema/set/include_spec'

describe 'DataObjects::Schema::Tables#include?' do

  subject { tables.include?(table) }

  let(:tables) { set                                    }
  let(:table)  { entry                                  }
  let(:entry)  { DataObjects::Schema::Table.new('name') }

  context 'when the entry is present' do

    let(:set) { DataObjects::Schema::Tables.new([entry]) }

    it_should_behave_like 'DataObjects::Schema::Set#include? when the entry is present'

  end

  context 'when the entry is not present' do

    let(:set) { DataObjects::Schema::Tables.new }

    it_should_behave_like 'DataObjects::Schema::Set#include? when the entry is not present'

  end

end

