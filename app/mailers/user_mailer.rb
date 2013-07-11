class UserMailer < ActionMailer::Base
  default :from => "imi.praktiinfo@gmail.com"

  def registration_confirmation(user)
  	@user = user
  	mail(:to => "#{user.name} #{user.last_name} <#{user.email}>", :subject => "(IMI-Map) Registered")
  end

  def create_internship_confirmation(user)
  	@user = user
  	mail(:to => "#{user.name} <#{user.email}>", :subject => "(IMI-Map) New Internship is created")
  end

  def notification_to_email(user)
  	@user = user
  	mail(:to => "#{user.name} <#{user.email}>", :subject => "(IMI-Map) New Notification")
  end

  def forgot_pwd(user)
    @user = user
    mail :to => user.email, :subject => "(IMI-Map)Password Reset"
  end

  def invite_student(student)
    @student = student
    mail(to: student.email, subject: "Come and join IMI-Map")
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

end
