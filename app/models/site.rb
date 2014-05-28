class Site < ActiveRecord::Base
  validates_presence_of :subdomain

  belongs_to :user
  has_many :layouts
  has_many :designs, through: :layouts
  has_many :events, :dependent => :destroy

end