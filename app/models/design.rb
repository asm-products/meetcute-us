class Design < ActiveRecord::Base

  validates_presence_of :name, :description

  mount_uploader :image, DesignUploader

  has_one :layout
  has_one :site, through: :layout
end
