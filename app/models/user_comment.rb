class UserComment < ActiveRecord::Base
  attr_accessible :body, :internship_id

  validates :body, :presence => true
  validates :internship_id, :presence => true

  
  belongs_to :internship
  belongs_to :user

  has_one :answer, :dependent => :destroy
end
