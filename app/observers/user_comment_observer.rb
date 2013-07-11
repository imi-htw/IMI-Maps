class UserCommentObserver < ActiveRecord::Observer
  def after_save(comment)
  	noti = Notification.new
  	noti.user_id = comment.internship.student.user.id
  	noti.text = "noti.comment"
  	noti.link = "/#{I18n.locale}/internships/#{comment.internship.id}"
  	noti.read = false
  	noti.save
  end
end