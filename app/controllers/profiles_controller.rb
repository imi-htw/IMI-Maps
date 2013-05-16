class ProfilsController < ApplicationController


  def new
    @profil = Profil.new
  end

  def create
    @profil = Profil.new(params[:profil])
    if @profil.valid?
      # TODO send message here
      redirect_to root_url, notice: "Message sent! Thank you for contacting me"
    else
      redirect_to :action => 'show', :controller => 'internships' 
    end
  end
end    