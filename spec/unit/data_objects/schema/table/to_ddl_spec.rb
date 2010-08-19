require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Table#to_ddl' do

  subject { table.to_ddl }

  let(:table) { DataObjects::Schema::Table.new('foo') }

  it { pending { expect { subject }.to_not raise_error(NotImplementedError) } }

end

