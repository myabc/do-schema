share_examples_for 'DataObjects::Schema::OrderedSet#merge when merging two empty sets' do

  it { should be_instance_of(set.class) }
  it { should equal(set)                }
  it { should == set                    }

end

share_examples_for 'DataObjects::Schema::OrderedSet#merge when merging a set with already present entries' do

  it { should equal(set)     }
  it { should == set         }
  it { should include(entry) }

  it 'does not add an entry to the set' do
    expect { subject }.to_not change { set.length }
  end

end

share_examples_for 'DataObjects::Schema::OrderedSet#merge when merging a set with not yet present entries' do

  it { should_not equal(set)  }
  xit { should_not eq(set)    }
  it { should include(entry1) }
  it { should include(entry2) }

  it 'adds an entry to the set' do
    expect { subject }.to change { set.length }.from(1).to(2)
  end

end
