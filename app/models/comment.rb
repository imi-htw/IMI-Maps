class Comment < ActiveRecord::Base
  attr_accessible :body  
  
  belongs_to :internship
  belongs_to :user
end
