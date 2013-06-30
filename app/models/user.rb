class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :internship_authorization, :publicmail, :mailnotif, :student_id
  
  validates :email, :presence => true
  validates :password, :presence => true
  validates :internship_authorization, :presence => true

  
  # associations
  has_one :internship
  belongs_to :student
  has_many :user_comments, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_many :notifications, :dependent => :destroy



  def name
    "#{student.first_name} #{student.last_name}"
  end
end
