class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :first_name, :last_name, :major, :role, :picture, :password, :password_confirmation, :internship_authorization, :publicmail, :mailnotif
  
  validates :email, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :major, :presence => true
  validates :role, :presence => true
  #validates :picture, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  validates :internship_authorization, :presence => true
  validates :publicmail, :presence => true
  validates :mailnotif, :presence => true

  
  # associations
  has_one :internship
  has_many :user_comments, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_many :notifications, :dependent => :destroy

  mount_uploader :picture, PictureUploader


  def name
    "#{first_name} #{last_name}"
  end
end
