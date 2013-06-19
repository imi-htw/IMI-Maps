class FavoriteCompareController < ApplicationController

  def index
    @favorite = Favorite.find(params[:id])
    @internship = @favorite.internship
    if(Favorite.comparebox = true) 
      @favorite.find(params[:id])

    end


  end


end
