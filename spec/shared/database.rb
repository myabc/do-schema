shared_examples_for "databases" do
  describe "Database" do
    describe "#tables" do
      it "returns a list of the tables in the database" do
        database.tables.should include("users")
        database.tables.should include("photos")
        database.tables.should include("developers")
      end
    end
  end
end
