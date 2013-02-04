share_examples_for 'DataObjects::Schema::OrderedSet#entries with no entries' do

  it { should be_empty }

end

share_examples_for 'DataObjects::Schema::OrderedSet#entries with entries' do

  it { should include(entry) }

end
