require 'rails_helper'

describe Account do
  let!(:account) { create(:account)}

  it "has a valid factory" do
    account.should be_valid
  end
  
  it "is invalid without a first_name" do
    build(:account, first_name: nil).should_not be_valid
  end
  
  it "is invalid without a last_name" do
    build(:account, last_name: nil).should_not be_valid
  end
  
end