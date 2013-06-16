class InternshipRating < ActiveRecord::Base
  attr_accessible :appreciation, :atmosphere, :supervision, :tasks, :training_success

  has_many :internships

  validates :appreciation, :atmosphere, :supervision, :tasks, :training_success, :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }
end
