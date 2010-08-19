require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Column#eql?' do

  subject { column == other }

  let(:name)    { 'foo'                                          }
  let(:options) { {}                                             }
  let(:column)  { DataObjects::Schema::Column.new(name, options) }

  context 'with the same column' do

    let(:other) { column }

    it { should be(true) }

    it 'is symmetric' do
      should == other.eql?(column)
    end
  end

  context 'with an equivalent column' do

    let(:other) { column.dup }

    it { should be(true) }

    it 'is symmetric' do
      should == other.eql?(column)
    end
  end

  context 'with a different column name' do

    let(:other) { DataObjects::Schema::Column.new('different name', options) }

    it { should be(false) }

    it 'is symmetric' do
      should == other.eql?(column)
    end
  end

end

