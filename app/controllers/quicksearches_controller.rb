class QuicksearchesController < ApplicationController

	def index
		@quicksearch = Quicksearch.new
		@companies = @quicksearch.companies(params[:query])

		@pins = @companies.to_gmaps4rails do |company, marker |
      marker.infowindow ("<a href='/companies/#{company.id}' style='font-weight:bold'>#{company.name}</a><p>Industry: #{company.industry}</p><p>Employees: #{company.number_employees}</p><a href='#{company.website}'>#{company.website}</a>")
    end

    respond_to do |format|
    	format.html
      format.js { render :layout=>false, :json => @pins }
    end
  end

end
