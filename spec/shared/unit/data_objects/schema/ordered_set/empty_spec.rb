share_examples_for 'DataObjects::Schema::OrderedSet#empty? with no entries in it' do

  it { should be(true) }

end

share_examples_for 'DataObjects::Schema::OrderedSet#empty? with entries in it' do

  it { should be(false) }

end
