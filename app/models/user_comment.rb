class UserComment < ActiveRecord::Base
  attr_accessible :body, :internship_id
  
  belongs_to :internship
  belongs_to :user

  has_one :answer, :dependent => :destroy
end
