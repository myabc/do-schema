require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Columns#<<' do

  subject { columns << entry2 }

  let(:columns) { set                                            }

  let(:set)     { DataObjects::Schema::Columns.new([entry1])     }
  let(:entry1)  { DataObjects::Schema::Column.new('column1', {}) }

  context 'when appending a not yet included column' do

    let(:entry2) { DataObjects::Schema::Column.new('column2', {}) }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#<< when appending a not yet included entry'

  end

  context 'when appending an already included column' do

    let(:entry2)  { entry1.dup }

    it_should_behave_like 'DataObjects::Schema::OrderedSet#<< when appending an already included entry'

  end

end
