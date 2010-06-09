require 'spec_helper'
require 'sqlite3_connection'

describe "Schema" do
  let(:database) { DataObjects::Schema.load("sqlite3://#{File.expand_path(@@db_file)}") }

  it "loads a database based on a uri" do
    database.should_not be_nil
  end

  it_should_behave_like("databases")
end


