require 'spec_helper'

describe Subscription do
  let!(:subscription) {FactoryGirl.create(:subscription, user_id: 1)}

  it "has a valid factory" do
    subscription.should be_valid
  end

  it "is invallid without a plan_id" do
    FactoryGirl.build(:subscription, plan_id: nil).should_not be_valid
  end

end
