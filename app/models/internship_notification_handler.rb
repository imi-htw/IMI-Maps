class InternshipNotificationHandler

  attr_reader :internship, :student, :user

  def initialize(options)
    @internship = options[:internship]
    @student = internship.student
    @user = student.user
  end

  def notify
    send_notification
    send_email
  end

private
    def send_notification
      binding.pry
      user.notifications.create(text: "Your internship is ready!", link: "")
    end

    def send_email
      InternshipMailer.internship_ready(internship, student).deliver
    end
end
