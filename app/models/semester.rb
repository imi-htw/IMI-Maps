class Semester < ActiveRecord::Base
  attr_accessible :semester

  validates :semester, :presence => true

  has_many :internship
end
