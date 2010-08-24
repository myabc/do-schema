require 'spec_helper'

shared_examples_for 'DataObjects::Schema::Collection#<< when appending a not yet included entry' do

  its(:entries) { should include(entry1) }
  its(:entries) { should include(entry2) }

  it 'adds one table to the collection' do
    expect { subject }.to change { collection.entries.count }.from(1).to(2)
  end

end

shared_examples_for 'DataObjects::Schema::Collection#<< when appending an already included entry' do

  its(:entries) { should include(entry1) }
  its(:entries) { should include(entry2) }

  it 'does not add a table to the collection' do
    expect { subject }.to_not change { collection.entries.count }
  end

end

