require 'spec_helper'

shared_examples_for 'DataObjects::Schema::Set#include? when the entry is present' do

  it { should be(true) }

end

shared_examples_for 'DataObjects::Schema::Set#include? when the entry is not present' do

  it { should be(false) }

end

