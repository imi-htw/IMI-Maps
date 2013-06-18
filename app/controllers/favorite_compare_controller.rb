class FavoriteCompareController < ApplicationController

  def index
    @favorite = Favorite.find(params[:id])
    @internship = @favorite.internship

  end


end
