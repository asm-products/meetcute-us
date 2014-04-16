require 'spec_helper'

describe Subscription do
  let!(:subscription) {FactoryGirl.create(:subscription, user_id: 1)}

  it "has a valid factory" do
    subscription.should be_valid
  end

  it "is invallid without a plan_id" do
    FactoryGirl.build(:subscription, plan_id: nil).should_not be_valid
  end

  context "Stripe integration" do
    
    before { StripeMock.start }
    after { StripeMock.stop }
  
    describe ".save_with_payment" do

      it "creates a stripe customer" do
        plan = Stripe::Plan.create(id: "test_plan")

        if subscription.valid?
          customer = Stripe::Customer.create(
            description: "test",
            plan: plan.id,
            card: StripeMock.generate_card_token(last4: "9191", exp_year: 1984)
          )
          subscription.stripe_customer_token = customer.id
        end

        expect(subscription.stripe_customer_token).to eq(customer.id)
      end
  
    end
  
  end

end