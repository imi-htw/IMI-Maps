class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :first_name, :last_name, :major, :role, :picture, :password, :password_confirmation, :internship_authorization
  
  # associations
  has_one :internship
  has_many :user_comments

  mount_uploader :picture, PictureUploader


  def name
    "#{first_name} #{last_name}"
  end
end
