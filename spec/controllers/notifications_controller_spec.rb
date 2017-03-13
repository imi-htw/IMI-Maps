require 'rails_helper'

RSpec.describe NotificationsController, :type => :controller do
  render_views

  before :each do
    @notification =  create :notification, link: "http://localhost"
  end


  describe "DELETE #destroy" do
    it 'assigns @noti' do
      delete :destroy, id: @notification
      expect(assigns(:noti)).to eq(@notification)
    end

    it 'destroys @noti' do
      expect {
        delete :destroy, id: @notification
      }.to change(Notification, :count).by(-1)
    end

    it 'redirects to @noti.link' do
      delete :destroy, id: @notification
      expect(response).to redirect_to @notification.link
    end
  end

  describe "GET #show" do
    it 'assigns @noti' do
      get :show, id: @notification
      expect(assigns(:noti)).to eq(@notification)
    end

    it 'destroys @noti' do
      expect {
        get :show, id: @notification
      }.to change(Notification, :count).by(-1)
    end

    it 'redirects to @noti.link' do
      get :show, id: @notification
      expect(response).to redirect_to @notification.link
    end
  end
end
