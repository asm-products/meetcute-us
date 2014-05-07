class Design < ActiveRecord::Base
  
  validates_presence_of :name, :description

  belongs_to :site

end
