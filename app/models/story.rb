class Story < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :site
end
