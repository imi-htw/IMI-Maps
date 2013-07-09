class UserObserver < ActiveRecord::Observer

  def after_create(model)
    if model.student && model.student.internships
      model.student.internships.each do |internship|
        if internship.editable?
          InternshipNotificationHandler.new(internship: internship).notify
        end
      end
    end
  end
end
