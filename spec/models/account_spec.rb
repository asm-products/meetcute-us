require 'rails_helper'

describe Account, :type => :model do
  let!(:account) { create(:account)}

  it "has a valid factory" do
    expect(account).to be_valid
  end
  
  it "is invalid without a first_name" do
    expect(build(:account, first_name: nil)).not_to be_valid
  end
  
  it "is invalid without a last_name" do
    expect(build(:account, last_name: nil)).not_to be_valid
  end
  
end