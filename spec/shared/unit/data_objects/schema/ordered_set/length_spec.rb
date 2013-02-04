share_examples_for 'DataObjects::Schema::OrderedSet#length when no entry is present' do

  it { should == 0 }

end

share_examples_for 'DataObjects::Schema::OrderedSet#length when 1 entry is present' do

  it { should == 1 }

end

share_examples_for 'DataObjects::Schema::OrderedSet#length when more than 1 entry is present' do

  it { should == expected_length }

end
