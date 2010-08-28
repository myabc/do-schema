require 'spec_helper'

shared_examples_for 'DataObjects::Schema::Set#entries with no entries' do

  it { should be_empty }

end

shared_examples_for 'DataObjects::Schema::Set#entries with entries' do

  it { should include(entry) }

end

