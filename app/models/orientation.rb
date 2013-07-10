class Orientation < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, :presence => true
  
  has_many :internships
end
