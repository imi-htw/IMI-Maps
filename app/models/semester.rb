class Semester < ActiveRecord::Base
  attr_accessible :semester

  has_many :internship
end
