class Salary < ActiveRecord::Base
  attr_accessible :amount, :order_id

  has_many :internships
end
