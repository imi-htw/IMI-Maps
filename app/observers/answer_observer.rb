class AnswerObserver < ActiveRecord::Observer
  def after_save(answer)
  	noti = Notification.new
  	noti.user_id = answer.user_comment.user.id
  	noti.text = "noti.answer"
  	noti.link = "/#{I18n.locale}/internships/#{answer.user_comment.internship.id}"
  	noti.read = false
  	noti.save
  end
end