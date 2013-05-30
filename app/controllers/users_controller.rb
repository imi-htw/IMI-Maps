class UsersController < ApplicationController
  before_filter :authorize
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: t('sign_up')
    else
      render 'new'
    end
  end

  def show 
    @user = User.find(params[:id])
  end

end
