class AnswerObserver < ActiveRecord::Observer
  def after_save(answer)
  	noti = Notification.new
  	noti.user_id = answer.user_comment.user.id
  	noti.text = "Someone answered on your comment"
  	noti.link = "/#{I18n.locale}/internships/#{answer.user_comment.internship.id}"
  	noti.read = false
  	noti.save
  end
end