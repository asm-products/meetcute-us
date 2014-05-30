class Site < ActiveRecord::Base
  validates_presence_of :subdomain

  before_save :create_default_layout, :if => :has_no_layout?

  belongs_to :user
  has_one :layout
  has_one :design, through: :layout
  has_many :events, :dependent => :destroy

  accepts_nested_attributes_for :design

  private

  def create_default_layout
    self.build_layout(design_id: 1)
  end

  def has_no_layout?
    !self.layout.present?
  end

end