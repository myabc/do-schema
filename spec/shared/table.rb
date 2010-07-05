shared_examples_for "table" do
  describe "Table" do
    let(:users) { database.table("users")}

    it "has a name" do
1.should ==1
#      users.name.should =="users"
    end

    it "has a database" do
p users
#      users.should == users
#      users.database.should == database
    end
  end
end
