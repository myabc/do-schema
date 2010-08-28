require 'spec_helper'

shared_examples_for 'DataObjects::Schema::Set#empty? with no entries in it' do

  it { should be(true) }

end

shared_examples_for 'DataObjects::Schema::Set#empty? with entries in it' do

  it { should be(false) }

end

