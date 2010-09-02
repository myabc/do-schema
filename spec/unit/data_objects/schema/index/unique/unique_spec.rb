require 'spec_helper'
require 'spec/unit/data_objects/schema/index/unique/shared/unique_spec'

require 'do-schema/index'

describe 'DataObjects::Schema::Index::Unique#unique?' do

  subject { index.unique? }

  let(:index) { DataObjects::Schema::Index::Unique.new(name, columns) }

  let(:name)    { 'unique_index'                                }
  let(:column)  { DataObjects::Schema::Column.new('column', {}) }
  let(:columns) { DataObjects::Schema::Columns.new([column])    }

  it_should_behave_like 'DataObjects::Schema::Index::Unique#unique?'

end

