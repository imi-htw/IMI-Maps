class Salary < ActiveRecord::Base
  attr_accessible :amount, :order_id, :min_amount, :max_amount

  validates :amount, :presence => true
  validates :order_id, :presence => true
  validates :min_amount, :presence => true
  validates :max_amount, :presence => true


  has_many :internships

  def name
    self.amount
  end
  
end
