class UserVerificationsController < ApplicationController

  def new
  end

  def create
    ldap = LdapAuthentication.new("141.45.146.101", 389, params[:user_name], params[:password])
    if ldap.authorized?
      session[:enrolment_number] = params[:user_name].split("s0")[1]
      redirect_to new_user_path
    else
      render :new
    end
  end
end
