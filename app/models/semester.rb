class Semester < ActiveRecord::Base
  attr_accessible :semester

  belongs_to :internship
end
