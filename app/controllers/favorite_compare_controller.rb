class FavoriteCompareController < ApplicationController

  def index
    
    @internships = Internship.find(params[:favorite_ids])

    respond_to do |format|
      format.js { render :layout=>false }
    end

  end


end
