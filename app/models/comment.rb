class Comment < ActiveRecord::Base
  attr_accessible :body, :internship_id
  
  belongs_to :internship
  belongs_to :user
end
