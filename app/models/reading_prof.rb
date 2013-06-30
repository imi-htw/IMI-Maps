class ReadingProf < ActiveRecord::Base
  attr_accessible :name

  has_many :internship_records

end
