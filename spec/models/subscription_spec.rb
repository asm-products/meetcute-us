require 'spec_helper'

describe Subscription do
  let!(:subscription) {FactoryGirl.create(:subscription)}

  it "has a valid factory" do
    subscription.should be_valid
  end

  it "is invallid without a user_id" do
    FactoryGirl.build(:subscription, user_id: nil).should_not be_valid
  end

end
