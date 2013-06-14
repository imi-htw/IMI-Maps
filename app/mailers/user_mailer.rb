class UserMailer < ActionMailer::Base
  default :from => "IMI.Prakti.Info@gmail.com"

  def registration_confirmation(user)
  	@user = user
  	mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "Registered")
  end

end
