class Site < ActiveRecord::Base
  validates_presence_of :subdomain

  before_save :create_default_layout, :if => :has_no_design?

  belongs_to :user
  has_many :layouts
  has_many :designs, through: :layouts
  has_many :events, :dependent => :destroy

  private

  def create_default_layout
    self.layouts.new(site_id: self.id, design_id: 1)
  end

  def has_no_design?
    self.layouts.nil?
  end

end