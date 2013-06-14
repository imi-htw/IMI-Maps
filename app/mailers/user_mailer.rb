class UserMailer < ActionMailer::Base
  default :from => "IMI.Prakti.Info@gmail.com"

  def registration_confirmation(user)
  	mail(:to => user.email, :subject => "Registered")
  end

end
