class Notification < ActiveRecord::Base
  attr_accessible :read, :text, :link

  belongs_to :user
end
