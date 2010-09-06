require 'spec_helper'
require 'spec/unit/data_objects/schema/constraint/shared/name_spec'

require 'do-schema/constraint'

describe 'DataObjects::Schema::Constraint::Check#name' do

  subject { check.name }

  let(:check)      { DataObjects::Schema::Constraint::Check.new(name, expression) }
  let(:name)       { 'default'                                                    }
  let(:expression) { 'expression'                                                 }

  it_should_behave_like 'DataObjects::Schema::Constraint#name'

end

