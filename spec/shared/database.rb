shared_examples_for "databases" do
  describe "Database" do
    describe "#tables" do
      it "returns a list of the tables in the database" do
        table_names = database.tables.map(&:name)

        table_names.should include("users")
        table_names.should include("photos")
        table_names.should include("developers")
      end
    end

    describe "#table_exists?" do
      it "returns true if the table exists" do
        database.table_exists?("users").should be_true
      end

      it "returns false if the table does not exist" do
        database.table_exists?("puppies").should be_false
      end
    end

    describe "#columns" do
      it "returns a list of columns for the given table" do
        columns = database.columns("users")
        column_names = columns.map(&:name)

        column_names.should include("id")
        column_names.should include("name")
      end
    end

    describe "#table" do
      it "returns a table with a given name" do
        database.table('users').should_not be_nil
        database.table("users").should be_kind_of(DataObjects::Schema::Table)
      end

      it "returns nil if the table doesn't exist" do
        database.table('puppies').should be_nil
      end
    end
  end
end
