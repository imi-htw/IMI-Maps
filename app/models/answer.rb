class Answer < ActiveRecord::Base
  attr_accessible :body, :internship_id, :user_comment_id

  validates :body, :presence => true
  validates :internship_id, :presence => true
  validates :user_comment_id, :presence => true

  belongs_to :user_comment
  belongs_to :user
  belongs_to :internship

end
