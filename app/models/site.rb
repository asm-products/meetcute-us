class Site < ActiveRecord::Base
  validates_presence_of :subdomain

  before_save :create_default_layout, :if => :has_no_layout?

  belongs_to :user
  has_one :layout
  has_one :design, through: :layout
  has_many :events, :dependent => :destroy

  accepts_nested_attributes_for :layout

  def create_default_layout
    self.build_layout(design: Site.default_design)
  end

  private

  def has_no_layout?
    !self.layout.present?
  end

  def self.default_design
    Design.find(1)
  end

end