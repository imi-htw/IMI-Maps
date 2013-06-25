class NotificationsController < ApplicationController

	def update 

	@user = User.find(current_user.id)
		
    @noti = Notification.find(params[:id])

    @noti.read = true

    @noti.save

    if (@user.mailnotif == true)
      UserMailer.notification_to_email(@user).deliver
    end

    redirect_to @noti.link
  end

end