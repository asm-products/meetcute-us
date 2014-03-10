require 'spec_helper'

describe Subscription do
  let!(:subscription) {FactoryGirl.create(:subscription)}

  it "has a valid factory" do
    subscription.should be_valid
  end
end
