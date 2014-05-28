class Design < ActiveRecord::Base
  
  validates_presence_of :name, :description

  mount_uploader :image, DesignUploader

  belongs_to :site

end
