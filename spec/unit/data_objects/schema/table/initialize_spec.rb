 require 'spec_helper'
 require 'do-schema/table'

 describe 'DataObjects::Schema::Table#initialize' do

   let(:name) { 'name' }

   share_examples_for 'calling DataObjects::Schema::Table#initialize' do

     its(:name)    { should == name }
     its(:columns) { should == DataObjects::Schema::Columns.new([]) }

   end

   context 'when no columns are passed at construction time' do

     subject { DataObjects::Schema::Table.new(name) }

     it_should_behave_like 'calling DataObjects::Schema::Table#initialize'

   end

   context 'when an array is passed at construction time' do

     subject { DataObjects::Schema::Table.new(name, []) }

     it_should_behave_like 'calling DataObjects::Schema::Table#initialize'

   end

 end
