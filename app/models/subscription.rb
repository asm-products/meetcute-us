class Subscription < ActiveRecord::Base
  
  validates_presence_of :user_id, :plan_id

  belongs_to :plan
  belongs_to :user

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(
        description: "test",
        plan: plan_id,
        card: stripr_card_token
      )
      self.stripr_card_token = customer.id
      save!
    end
  end
end
