class Layout < ActiveRecord::Base
  belongs_to :site
  has_one :design
end
