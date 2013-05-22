class Answer < ActiveRecord::Base
  attr_accessible :body, :internship_id, :user_comment_id

  belongs_to :user_comment
  belongs_to :user
end
