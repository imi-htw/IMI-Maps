class InternshipMailer < ActionMailer::Base
  default :from => "IMI.Prakti.Info@gmail.com"

  def internship_ready(internship, user)
    @user = user
    @internship = internship
    mail(to: user.email, subject: "IMI-Map: Please tell us about your internship")
  end
end
