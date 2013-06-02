class LocationController < ApplicationController

	def create 

		@location = Location.new
		@location.internship_id = params[:company_id]
		@location.save

    redirect_to :action => 'show', :controller => 'companies', :id => @location.company_id

	end

	def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

end
