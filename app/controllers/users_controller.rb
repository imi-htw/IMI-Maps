class UsersController < ApplicationController
  #before_filter :authorize

  def new
    @user = User.new
    @user = UserCreationForm.new(session[:enrolment_number])
  end

  def create
    @user = UserCreationForm.new(session[:enrolment_number])
    if @user.submit(params[:user])
      #UserMailer.registration_confirmation(@user).deliver
      session[:user_id] = @user.id
      redirect_to overview_index_path, notice: t('sign_up')
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Details were successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


end
