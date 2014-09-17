class Gallery < ActiveRecord::Base
  validates_presence_of :title, :description

  belongs_to :site
  has_many :images, :dependent => :destroy

  accepts_nested_attributes_for :images, :allow_destroy => true
end
