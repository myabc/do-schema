require 'spec_helper'
require 'do-schema/database'

describe 'DataObjects::Schema::Database#uri' do

  subject { database.uri }

  let(:name)     { 'foo' }
  let(:uri)      { Addressable::URI.parse('mysql://localhost/do_schema_test') }
  let(:database) { DataObjects::Schema::Database.new(name, uri, []) }

  it { should == uri }

end

