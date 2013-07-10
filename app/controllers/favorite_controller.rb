class FavoriteController < ApplicationController
  before_filter :authorize

	def create 

		@favorite = Favorite.new
		@favorite.internship_id = params[:internship_id]
		@favorite.user_id = params[:user_id]
		@favorite.save

    @current_user = @favorite.user
    @internship = @favorite.internship

    respond_to do |format|
      format.js { render :layout=>false,:locals => { :current_user  => @current_user, :internship => @internship, :favorite => @favorite} }
    end
	end

	def destroy
    @favorite = Favorite.find(params[:id])
    @current_user = @favorite.user
    @internship = @favorite.internship
    @favorite.destroy

    respond_to do |format|
      format.js { render :layout=>false,:locals => { :current_user  => @current_user, :internship => @internship, :favorite => @favorite} }
    end
  end

  def index

    @favorites = current_user.favorites        

  end

end
