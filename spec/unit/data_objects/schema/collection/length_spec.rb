require 'spec_helper'

shared_examples_for 'DataObjects::Schema::Collection#length when no entry is present' do

  it { should == 0 }

end

shared_examples_for 'DataObjects::Schema::Collection#length when 1 entry is present' do

  it { should == 1 }

end

shared_examples_for 'DataObjects::Schema::Collection#length when more than 1 entry is present' do

  it { should == expected_length }

end

