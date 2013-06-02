class FavoriteController < ApplicationController

	def create 

		@favorite = Favorite.new
		@favorite.internship_id = params[:internship_id]
		@favorite.user_id = params[:user_id]
		@favorite.save

    redirect_to :action => 'show', :controller => 'internships', :id => @favorite.internship_id

	end

	def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    redirect_to :action => 'show', :controller => 'internships', :id => params[:internship_id]

  end

end
