class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :internship_id, :comparebox

  validates :user_id, :presence => true
  validates :internship_id, :presence => true

  belongs_to :user
  belongs_to :internship
end
