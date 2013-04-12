class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :major, :role, :picture
  
  # associations
  has_one :internship

  mount_uploader :picture, PictureUploader
end
