class Comment < ActiveRecord::Base
  belongs_to :post, :internship
  attr_accessible :body, :commenter
end
