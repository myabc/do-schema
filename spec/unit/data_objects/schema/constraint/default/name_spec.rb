require 'spec_helper'
require 'spec/unit/data_objects/schema/constraint/shared/name_spec'

require 'do-schema/constraint'

describe 'DataObjects::Schema::Constraint::Default#name' do

  subject { default.name }

  let(:default) { DataObjects::Schema::Constraint::Default.new(name, value) }
  let(:name)    { 'default'                                                 }
  let(:value)   { 'default'                                                 }

  it_should_behave_like 'DataObjects::Schema::Constraint#name'

end

