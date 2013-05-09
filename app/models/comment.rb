class Comment < ActiveRecord::Base
  belongs_to :internship
  attr_accessible :body, :commenter
end
