class Event < ActiveRecord::Base
  validates_presence_of :date, :title

  belongs_to :site
end