class InternshipObserver < ActiveRecord::Observer

  def after_create(model)
    student = Student.find(model.student_id)
    unless student.has_user? && student.nil?
      UserMailer.invite_student(student).deliver
    end
  end

  def after_update(model)
    if model.report_state_id_changed? and model.editable?
      InternshipNotificationHandler.new(internship: model).notify
    end
  end
end




