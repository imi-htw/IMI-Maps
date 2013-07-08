class InternshipObserver < ActiveRecord::Observer

  def after_create(model)
    binding.pry
    student = Student.find(model.student_id)
    if student.has_user?
      InternshipMailer.edit_notifiaction(student).deliver
    else
      InternshipMailer.edit_notifiaction(student).deliver
    end
  end

  def after_update(model)
    binding.pry
    if model.report_state_id_changed? and model.editable?
      InternshipNotificationHandler.new(internship: model).notify
    end
  end
end


class InternshipNotificationHandler

  attr_reader :internship, :student, :user

  def initialize(options)
    @internship = options[:internship]
    @student = internship.student
    @user = student.try(:user)
  end

  def notify
    send_notification
    send_email
  end

private
    def send_notification
      user.notifications.create(text: "Your internship is ready!")
    end

    def send_email
      InternshipMailer.internship_ready(internship, student).deliver
    end
end


