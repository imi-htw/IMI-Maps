class NotificationsController < ApplicationController

	def destroy
    @noti = Notification.find(params[:id])
    link = @noti.link
    @noti.destroy
    redirect_to link
  end

end