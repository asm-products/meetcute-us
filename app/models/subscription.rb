class Subscription < ActiveRecord::Base
  
  validates_presence_of :user_id, :plan_id

  belongs_to :plan
  belongs_to :user
end
