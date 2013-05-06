class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :first_name, :last_name, :major, :role, :picture, :password, :password_confirmation
  
  # associations
  has_one :internship

  mount_uploader :picture, PictureUploader
end
