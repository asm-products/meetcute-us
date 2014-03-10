require 'spec_helper'

describe Plan do
  let!(:plan) { FactoryGirl.create(:plan) }

  it "should have a valid factory" do
    plan.should be_valid
  end

  it "is invalid without an amount" do
    FactoryGirl.build(:plan, amount: nil).should_not be_valid
  end
  
  it "is invalid without an interval" do
    FactoryGirl.build(:plan, interval: nil).should_not be_valid
  end
  
  it "is invalid without a currency" do
    FactoryGirl.build(:plan, currency: nil).should_not be_valid
  end
  
  it "is invalid wighout a stripe_id" do
    FactoryGirl.build(:plan, stripe_id: nil).should_not be_valid
  end
end