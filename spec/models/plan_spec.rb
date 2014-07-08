require 'rails_helper'

describe Plan, :type => :model do
  let!(:plan) { create(:plan) }

  it "should have a valid factory" do
    expect(plan).to be_valid
  end

  it "is invalid without an amount" do
    expect(build(:plan, amount: nil)).not_to be_valid
  end
  
  it "is invalid without an interval" do
    expect(build(:plan, interval: nil)).not_to be_valid
  end
  
  it "is invalid without a currency" do
    expect(build(:plan, currency: nil)).not_to be_valid
  end
  
  it "is invalid wighout a stripe_id" do
    expect(build(:plan, stripe_id: nil)).not_to be_valid
  end
end