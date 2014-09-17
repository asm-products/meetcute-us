class Image < ActiveRecord::Base
  validates_presence_of :visible

  mount_uploader :image, ImageUploader

  belongs_to :gallery
end
