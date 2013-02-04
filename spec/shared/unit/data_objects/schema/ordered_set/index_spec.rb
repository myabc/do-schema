share_examples_for 'DataObjects::Schema::OrderedSet#index when the entry is not present' do

  it { should be(nil) }

end

share_examples_for 'DataObjects::Schema::OrderedSet#index when 1 entry is present' do

  it { should == 0 }

end

share_examples_for 'DataObjects::Schema::OrderedSet#index when 2 entries are present' do

  it { should == 1 }

end
