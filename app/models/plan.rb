class Plan < ActiveRecord::Base
  validates_presence_of :amount, :interval, :currency, :stripe_id

  has_many :subscriptions
end
