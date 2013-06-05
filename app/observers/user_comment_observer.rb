class UserCommentObserver < ActiveRecord::Observer
  def after_save(comment)
  	noti = Notification.new
  	noti.user_id = comment.internship.user.id
  	noti.text = "Someone commented on your internship"
  	noti.link = "/#{I18n.locale}/internships/#{comment.internship.id}"
  	noti.read = false
  	noti.save
  end
end