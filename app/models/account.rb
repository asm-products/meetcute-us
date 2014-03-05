class Account < ActiveRecord::Base
  validates_presence_of :user_id, :first_name, :last_name, :username
  validates_uniqueness_of :sub_domain

  belongs_to :user
end
