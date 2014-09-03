class Story < ActiveRecord::Base
  validates_presence_of :title

  mount_uploader :image, StoryUploader

  belongs_to :site
end
