share_examples_for 'DataObjects::Schema::OrderedSet#<< when appending an already included entry' do

  its(:entries) { should include(entry1) }
  its(:entries) { should include(entry2) }

  it 'does not add a table to the set' do
    expect { subject }.to_not change { set.entries.count }
  end

  it 'should not alter the position of the existing entry' do
    subject.index(entry1).should == set.entries.length - 1
  end

  it 'does not add an entry to the set' do
    expect { subject }.to_not change { subject.length }
  end

end

share_examples_for 'DataObjects::Schema::OrderedSet#<< when appending a not yet included entry' do

  its(:entries) { should include(entry1) }
  its(:entries) { should include(entry2) }

  it 'adds one table to the set' do
    expect { subject }.to change { set.entries.count }.from(1).to(2)
  end

  it 'should not alter the position of the existing entry' do
    subject.index(entry1).should == set.entries.length - 2
  end

  it 'should append columns at the end of the set' do
    subject.index(entry2).should == set.entries.length - 1
  end

end
