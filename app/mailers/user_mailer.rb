class UserMailer < ActionMailer::Base
  default :from => "IMI.Prakti.Info@gmail.com"

  def registration_confirmation(user)
  	@user = user
  	mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "(IMI-Maps) Registered")
  end

  def create_internship_confirmation(user)
  	@user = user
  	mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "(IMI-Maps) New Internship is created")
  end

  def notification_to_email(user)
  	@user = user
  	mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "(IMI-Maps) New Notification")
  end

end
