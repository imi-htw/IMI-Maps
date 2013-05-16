class Salary < ActiveRecord::Base
  attr_accessible :amount, :order_id, :min_amount, :max_amount

  has_many :internships

  def name
    self.amount
  end
  
end
