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

    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

end
