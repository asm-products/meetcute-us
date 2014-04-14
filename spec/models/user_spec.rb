require 'spec_helper'

describe User do
  let!(:user) {FactoryGirl.create(:user)}

  it { should have_one(:account) }

  it "has a valid factory" do
    user.should be_valid
  end

  it "is invalid without an email address" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end
  
  it "is invalid without a password" do
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end
  
  it "does not allow for duplicate email addresses" do
    FactoryGirl.create(:user, email: "test@test.com")
    FactoryGirl.build(:user, email: "test@test.com").should_not be_valid
  end

  it "creates a UserAccount when a User is created" do
    user = FactoryGirl.create(:user, :account_attributes => FactoryGirl.attributes_for(:account))
    expect(user.account).to_not be_nil
  end

  it "destroys it's related UserAccount when destroyed" do
    user = FactoryGirl.create(:user, :account_attributes => FactoryGirl.attributes_for(:account))
    user.destroy
    expect(Account.find_by_user_id(user.id)).to be_nil
  end

end