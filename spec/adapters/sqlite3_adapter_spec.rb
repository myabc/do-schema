require 'spec_helper'
require 'sqlite3_connection'

describe DataObjects::Schema do
  it "loads a database based on a uri" do
    database = DataObjects::Schema.load("sqlite3://#{File.expand_path(@@db_file)}")
    p database.tables
  end
end
