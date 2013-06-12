class SessionsController < ApplicationController
  layout 'sessions'

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    #userSignUp = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], last_name: params[:last_name], first_name: params[:first_name] )
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to overview_index_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end