class Subscription < ActiveRecord::Base
  validates_presence_of :user_id

  has_many :plans
  belongs_to :user
end
