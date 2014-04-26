class Site < ActiveRecord::Base
  validates_presence_of :subdomain

  belongs_to :user
end
