require 'spec_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user) }

  it { should have_one(:account) }
  it { should have_one(:site) }

  it "has a valid factory" do
    expect(user).to be_valid
  end

  it "is invalid without an email address" do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end
  
  it "is invalid without a password" do
    expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
  end
  
  it "does not allow for duplicate email addresses" do
    FactoryGirl.create(:user, email: "test@test.com")
    expect(FactoryGirl.build(:user, email: "test@test.com")).to_not be_valid
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

  it "creates a Sute when a User is created" do
    user = FactoryGirl.create(:user, :account_attributes => FactoryGirl.attributes_for(:account), :site_attributes => FactoryGirl.attributes_for(:site))
    expect(user.site).to_not be_nil
  end

  it "destroys it's related Site when destroyed" do
    user = FactoryGirl.create(:user, :account_attributes => FactoryGirl.attributes_for(:account), :site_attributes => FactoryGirl.attributes_for(:site))
    user.destroy
    expect(Site.find_by_user_id(user.id)).to be_nil
  end

end