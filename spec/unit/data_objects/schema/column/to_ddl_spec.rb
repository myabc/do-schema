require 'spec_helper'
require 'do-schema/table'

describe 'DataObjects::Schema::Column#to_ddl' do

  subject { column.to_ddl }

  let(:column) { DataObjects::Schema::Column.new('foo', {}) }

  it { pending { expect { subject }.to_not raise_error(NotImplementedError) } }

end

