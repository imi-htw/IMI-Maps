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
      user.notifications.create(text: "noti.report", link: Rails.application.routes.url_helpers.edit_internship_path(internship, locale: I18n.locale))
    end

    def send_email
      if user && user.mailnotif
        InternshipMailer.internship_ready(internship, user).deliver
      end
    end
end
