require 'spec_helper'

shared_examples_for 'DataObjects::Schema::Collection' do

  it { should be_kind_of(Enumerable) }

  it 'case matches Enumerable' do
    (Enumerable === subject).should be(true)
  end

end

shared_examples_for 'DataObjects::Schema::Collection#each' do

  it { should equal(collection) }

  it 'yields each column' do
    expect { subject }.to change { yields.dup }.from([]).to([entry])
  end

end


