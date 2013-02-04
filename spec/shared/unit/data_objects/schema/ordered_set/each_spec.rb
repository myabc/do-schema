share_examples_for 'DataObjects::Schema::OrderedSet' do

  it { should be_kind_of(Enumerable) }

  it 'case matches Enumerable' do
    (Enumerable === subject).should be(true)
  end

end

share_examples_for 'DataObjects::Schema::OrderedSet#each' do

  it { should equal(set) }

  it 'yields each column' do
    expect { subject }.to change { yields.dup }.from([]).to([entry])
  end

end
