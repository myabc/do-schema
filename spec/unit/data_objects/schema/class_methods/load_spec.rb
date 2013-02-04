require 'spec_helper'
require 'do-schema'

describe 'DataObjects::Schema.load' do

  subject { DataObjects::Schema.load(uri) }

  let(:uri) { mock(:uri) }

  it { pending { expect { subject }.to_not raise_error(NotImplementedError) } }

end
