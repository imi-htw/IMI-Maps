class NotificationsController < ApplicationController

	def update 
		
    @noti = Notification.find(params[:id])

    @noti.read = true

    @noti.save

    redirect_to @noti.link
  end

end