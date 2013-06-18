class FavoriteCompareController < ApplicationController

  def index
    @favorite = Favorite.find(params[:id])
    @internship = @favorite.internship
    if(Favorite_compare.favorite_compare = true) 
      @favorite.find(params[:id])

    end


  end


end
