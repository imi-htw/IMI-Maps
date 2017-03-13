require 'rails_helper'

RSpec.describe PasswordResetsController, :type => :controller do
  render_views

  before :each do
    @user = create :user, password_reset_token: "foo"
  end

  describe "GET #new" do
    it 'renders the new template' do
      get :new, format: :js
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it 'redirects to root_url' do
      post :create, email: @user.email
      expect(response).to redirect_to root_url
    end
  end

  describe "GET #edit"do
    it 'assigns @user' do
      get :edit, id: @user.password_reset_token
      expect(assigns(:user)).to eq(@user)
    end
  end

  describe "PUT #update" do
    it 'assigns @user' do
      @user.password_reset_sent_at = 1.hours.ago
      @user.save
      put :update, id: @user.password_reset_token
      expect(assigns(:user)).to eq(@user)
    end

    context 'password_reset_sent_at < 2 hours ago' do
      it 'redirects to root_url' do
        @user.password_reset_sent_at = 1.hours.ago
        @user.save
        put :update, id: @user.password_reset_token, user: attributes_for(:user)
        expect(response).to redirect_to root_url
      end

    end

    context 'password_reset_sent_at >= 2 hours ago' do
      it 'redirects to new_password_reset_path' do
        @user.password_reset_sent_at = 3.hours.ago
        @user.save
        put :update, id: @user.password_reset_token
        expect(response).to redirect_to new_password_reset_path
      end
    end

    context 'given incorrect parameters' do
      it 're-renders the edit template' do
        @user.password_reset_sent_at = 1.hours.ago
        @user.save
        put :update, id: @user.password_reset_token, user: attributes_for(:user, email: nil)
        expect(response).to render_template :edit
      end
    end
  end
end
