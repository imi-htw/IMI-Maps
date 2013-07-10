class InternshipRating < ActiveRecord::Base
  attr_accessible :appreciation, :atmosphere, :supervision, :tasks, :training_success

  has_many :internships

  validates :appreciation, :atmosphere, :supervision, :tasks, :training_success, :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }

  def total_rating
    if tasks and training_success and atmosphere and supervision and appreciation
      (tasks+training_success+atmosphere+supervision+appreciation).to_f/5
    end
  end

end
