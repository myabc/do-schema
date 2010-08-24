require 'spec_helper'

shared_examples_for 'DataObjects::Schema::Collection#merge when merging two empty collections' do

  it { should be_instance_of(collection.class) }
  it { should_not equal(collection)            }
  it { should == collection                    }

end

shared_examples_for 'DataObjects::Schema::Collection#merge when merging a collection with already present entries' do

  it { should include(entry) }

  it 'does not add an entry to the collection' do
    expect { subject }.to_not change { collection.length }
  end

end

shared_examples_for 'DataObjects::Schema::Collection#merge when merging a collection with not yet present entries' do

  it { should include(entry1) }
  it { should include(entry2) }

  it 'adds an entry to the collection' do
    expect { subject }.to change { collection.length }.from(1).to(2)
  end

end

