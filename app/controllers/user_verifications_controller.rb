class UserVerificationsController < ApplicationController

  def new
    respond_to do |format|
      format.js { render :layout=>false }
    end
  end

  def create
    # :nocov:
    ldap = LdapAuthentication.new("141.45.146.101", 389, params[:user_name], params[:password])
    if ldap.authorized?
      session[:enrolment_number] = params[:user_name].split("s0")[1]
      redirect_to new_user_path
    else
      flash[:error] =  "Benutzername oder Passwort nicht korrekt!"
      redirect_to root_url
    end
    # :nocov:
  end
end
