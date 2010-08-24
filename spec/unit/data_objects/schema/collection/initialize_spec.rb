require 'spec_helper'

shared_examples_for 'DataObjects::Schema::Collection#initialize when no entries are given' do

  it { should be_empty }

  its(:entries) { should be_empty }
  its(:length)  { should == 0     }

end

shared_examples_for 'DataObjects::Schema::Collection#initialize when entries are given and they do not contain duplicates' do

  it { should_not be_empty    }
  it { should include(entry1) }
  it { should include(entry2) }

  its(:length) { should ==  2 }

end

shared_examples_for 'DataObjects::Schema::Collection#initialize when entries are given and they contain duplicates' do

  it { should_not be_empty    }
  it { should include(entry1) }

  its(:length) { should ==  1 }

end

