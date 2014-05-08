require 'spec_helper'

describe Plan do
  let!(:plan) { create(:plan) }

  it "should have a valid factory" do
    plan.should be_valid
  end

  it "is invalid without an amount" do
    build(:plan, amount: nil).should_not be_valid
  end
  
  it "is invalid without an interval" do
    build(:plan, interval: nil).should_not be_valid
  end
  
  it "is invalid without a currency" do
    build(:plan, currency: nil).should_not be_valid
  end
  
  it "is invalid wighout a stripe_id" do
    build(:plan, stripe_id: nil).should_not be_valid
  end
end