require 'spec_helper'

describe User do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:admin_user) {FactoryGirl.create(:admin_user)}
  let!(:bronze_user) {FactoryGirl.create(:bronze_user)}
  let!(:silver_user) {FactoryGirl.create(:silver_user)}
  let!(:gold_user) {FactoryGirl.create(:gold_user)}

  it "has a valid factory" do
    user.should be_valid
  end

  it "has a valide admin user factory" do
    admin_user.should be_valid
  end

  it "has a valide bronze user factory" do
    bronze_user.should be_valid
  end

  it "has a valide silver user factory" do
    silver_user.should be_valid
  end

  it "has a valide gold user factory" do
    gold_user.should be_valid
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