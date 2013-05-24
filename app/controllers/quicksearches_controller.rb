class QuicksearchesController < ApplicationController

	def index
		@quicksearch = Quicksearch.new

    @companies = []

    @internships = @quicksearch.internships(params)

    @internships.each do |i|
      @companies << i.company
    end

		@pins = @companies.to_gmaps4rails do |company, marker |
      href =  if company.website.starts_with?'http' 
                company.website  
              else 
                "http://"+company.website 
              end
      marker.infowindow ("<a href='/companies/#{company.id}' style='font-weight:bold'>#{company.name}</a><p>Industry: #{company.industry}</p><p>Employees: #{company.number_employees}</p><a href='#{href}' target='_blank'>#{company.website}</a>")

    end

    respond_to do |format|
      format.js { render :layout=>false, :locals => { :pins  => @pins, :internships => @internships } }
    end
  end

end
