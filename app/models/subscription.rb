class Subscription < ActiveRecord::Base
  
  attr_accessor :stripe_card_token

  validates_presence_of :user_id, :plan_id

  belongs_to :plan
  belongs_to :user

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(
        description: "test",
        plan: plan_id,
        card: stripe_card_token
      )
      self.stripe_customer_token = customer.id
      save!
    end
  end
end
