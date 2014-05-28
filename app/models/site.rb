class Site < ActiveRecord::Base
  validates_presence_of :subdomain

  belongs_to :user
  has_many :designs, through: :site_designs
  has_many :events, :dependent => :destroy

end