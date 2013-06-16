class Student < ActiveRecord::Base
  attr_accessible :birthday, :birthplace, :email, :first_name, :enrolment_number, :last_name

  validates :last_name, :first_name, :email, :matrikelNr, :presence => true
  validates_uniquness_of :matrikelNr
end
