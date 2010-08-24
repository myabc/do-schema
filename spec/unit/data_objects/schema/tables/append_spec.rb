require 'spec_helper'
require 'do-schema/table'
require 'spec/unit/data_objects/schema/collection/append_spec'

describe 'DataObjects::Schema::Tables#<<' do

  subject { tables << entry2 }

  let(:tables)     { collection                                }

  let(:entry1)     { DataObjects::Schema::Table.new('table1')  }
  let(:collection) { DataObjects::Schema::Tables.new([entry1]) }

  context 'when appending a not yet present table' do

    let(:entry2)  { DataObjects::Schema::Table.new('table2') }

    it_should_behave_like 'DataObjects::Schema::Collection#<< when appending a not yet included entry'

  end

  context 'when appending an already present table' do

    let(:entry2)  { entry1.dup }

    it_should_behave_like 'DataObjects::Schema::Collection#<< when appending an already included entry'

  end

end

