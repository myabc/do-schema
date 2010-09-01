require 'spec_helper'

shared_examples_for 'DataObjects::Schema::Index#initialize' do

  its(:name)    { should == name }
  its(:columns) { should == columns }

end

