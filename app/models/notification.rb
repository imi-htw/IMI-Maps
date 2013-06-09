class Notification < ActiveRecord::Base
  attr_accessible :read, :text, :link

  validates :read, :presence => true
  validates :text, :presence => true
  validates :link, :presence => true

  belongs_to :user
end
