require 'spec_helper'

shared_examples_for 'DataObjects::Schema::Index#columns' do

  it { should == columns }

end

