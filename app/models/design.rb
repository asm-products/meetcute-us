class Design < ActiveRecord::Base
  
  validates_presence_of :name, :description

  mount_uploader :image, DesignUploader

  has_many :sites, through: :site_designs

end
