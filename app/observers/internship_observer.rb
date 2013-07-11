class InternshipObserver < ActiveRecord::Observer

  def after_update(model)
    if model.report_state_id_changed? and model.editable?
      InternshipNotificationHandler.new(internship: model).notify
    end
  end
end




