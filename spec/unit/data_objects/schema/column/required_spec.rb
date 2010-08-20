require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Column#required?' do

  context 'when not specified at construction time' do

    subject { column.required? }

    let(:column)  { DataObjects::Schema::Column.new('name', {}) }

    it { should be(true) }

  end

  context 'when :required => true was passed at construction time' do

    subject { column.required? }

    let(:options) { { :required => true } }
    let(:column)  { DataObjects::Schema::Column.new('name', options) }

    it { should be(true) }

  end

  context 'when :required => false was passed at construction time' do

    subject { column.required? }

    let(:options) { { :required => false } }
    let(:column)  { DataObjects::Schema::Column.new('name', options) }

    it { should be(false) }

  end

end

