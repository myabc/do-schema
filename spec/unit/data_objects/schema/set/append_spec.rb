require 'spec_helper'

shared_examples_for 'DataObjects::Schema::Set#<< when appending a not yet included entry' do

  its(:entries) { should include(entry1) }
  its(:entries) { should include(entry2) }

  it 'adds one table to the set' do
    expect { subject }.to change { set.entries.count }.from(1).to(2)
  end

end

shared_examples_for 'DataObjects::Schema::Set#<< when appending an already included entry' do

  its(:entries) { should include(entry1) }
  its(:entries) { should include(entry2) }

  it 'does not add a table to the set' do
    expect { subject }.to_not change { set.entries.count }
  end

end

