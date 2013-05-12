class Answer < ActiveRecord::Base
  attr_accessible :body, :internship_id, :comment_id

  belongs_to :comment
  belongs_to :user
end
