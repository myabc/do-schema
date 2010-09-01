require 'spec_helper'
require 'do-schema/index'

describe 'DataObjects::Schema::Index#unique?' do

  subject { index.unique? }

  let(:index) { DataObjects::Schema::Index.new(name, columns) }

  let(:name)    { 'index'                                       }
  let(:column)  { DataObjects::Schema::Column.new('column', {}) }
  let(:columns) { DataObjects::Schema::Columns.new([column])    }

  it { should be(false) }

end

