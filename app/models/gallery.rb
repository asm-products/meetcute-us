class Gallery < ActiveRecord::Base
  validates_presence_of :title, :description

  belongs_to :site
end
