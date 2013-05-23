class Orientation < ActiveRecord::Base
  attr_accessible :name

  
  has_many :internships
end
