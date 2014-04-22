require 'spec_helper'

describe Account do
  let!(:account) { FactoryGirl.create(:account)}

  it "has a valid factory" do
    account.should be_valid
  end
  
  it "is invalid without a first_name" do
    FactoryGirl.build(:account, first_name: nil).should_not be_valid
  end
  
  it "is invalid without a last_name" do
    FactoryGirl.build(:account, last_name: nil).should_not be_valid
  end

  it "does not allow duplicate subdomains per account" do
    FactoryGirl.create(:account, sub_domain: "mydomain")
    FactoryGirl.build(:account, sub_domain: "mydomain").should_not be_valid
  end
  
end