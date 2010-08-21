require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Tables#to_ddl' do

  subject { tables.to_ddl }

  let(:tables) { DataObjects::Schema::Tables.new }

  it { pending { expect { subject }.to_not raise_error(NotImplementedError) } }

end

