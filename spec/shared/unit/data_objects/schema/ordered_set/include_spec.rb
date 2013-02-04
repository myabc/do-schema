share_examples_for 'DataObjects::Schema::OrderedSet#include? when the entry is present' do

  it { should be(true) }

end

share_examples_for 'DataObjects::Schema::OrderedSet#include? when the entry is not present' do

  it { should be(false) }

end
