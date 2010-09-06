require 'spec_helper'
require 'spec/unit/data_objects/schema/constraint/shared/name_spec'

require 'do-schema/constraint'

describe 'DataObjects::Schema::Constraint::NotNull#name' do

  subject { not_null.name }

  let(:not_null) { DataObjects::Schema::Constraint::NotNull.new(name) }
  let(:name)     { 'not_null'                                         }

  it_should_behave_like 'DataObjects::Schema::Constraint#name'

end

