class InternshipMailer < ActionMailer::Base
  default :from => "IMI.Prakti.Info@gmail.com"

  def internship_ready(internship, student)
    @student = student
    @internship = internship
    mail(to: student.email, subject: "IMI-Map: Please tell us about your internship")
  end
end
