require 'spec_helper'

describe User do
  let!(:user) {FactoryGirl.create(:user)}

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

end