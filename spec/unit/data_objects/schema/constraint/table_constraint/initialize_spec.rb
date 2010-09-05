require 'spec_helper'

shared_examples_for 'DataObjects::Schema::Constraint::TableConstraint#initialize' do

  its(:name)    { should == name }
  its(:columns) { should == columns }

end

