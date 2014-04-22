class Account < ActiveRecord::Base
  
  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :sub_domain

  belongs_to :user, inverse_of: :account
end
