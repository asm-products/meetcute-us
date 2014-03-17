describe Ability do

  let!(:silver_user) {FactoryGirl.create(:silver_user)}
  let!(:gold_user) {FactoryGirl.create(:gold_user)}
  
  describe "as an admin user" do
    before :each do
      @user = @user ||= FactoryGirl.create(:admin_user)
      @ability = Ability.new(@user)
    end

    it "can manage all resources" do
      @ability.should be_able_to(:manage, :all)
    end

  end

  describe "as a bronze user" do
    before :each do
      @user = @user ||= FactoryGirl.create(:bronze_user)
      @ability = Ability.new(@user)
    end
    
    it "can CRUD User" do
      @ability.should be_able_to(:crud, User)
    end

    it "can CRUD Account" do
      @ability.should be_able_to(:crud, Account)
    end

    it "can CRUD Plan" do
      @ability.should be_able_to(:crud, Account)
    end

    it "can CRUD Subscription" do
      @ability.should be_able_to(:crud, Subscription)
    end

    it "cannot access ALL users" do
      @ability.should_not be_able_to(:read, for: User.all)
    end

  end

end