class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :internship_authorization, :publicmail, :mailnotif, :student_id
  
  validates :email, :presence => true
  validates :password, :presence => true, length: { minimum: 5 }
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

  before_create { generate_token(:auth_token) }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.forgot_pwd(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
