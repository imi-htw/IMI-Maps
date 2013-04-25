class Salary < ActiveRecord::Base
  attr_accessible :amount

  has_many :internships
end
