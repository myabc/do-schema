require 'spec_helper'
require 'do-schema/column'

describe 'DataObjects::Schema::Columns#to_ddl' do

  subject { columns.to_ddl }

  let(:columns) { DataObjects::Schema::Columns.new }

  it { pending { expect { subject }.to_not raise_error(NotImplementedError) } }

end

