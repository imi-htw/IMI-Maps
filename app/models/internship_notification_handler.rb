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
      user.notifications.create(text: "You can create your experience reort!", link: Rails.application.routes.url_helpers.edit_internship_path(internship, locale: I18n.locale))
    end

    def send_email
      InternshipMailer.internship_ready(internship, student).deliver
    end
end
