class QuicksearchesController < ApplicationController

	def index

		@quicksearch = Quicksearch.new

    @companies = []

    @orientations_ary = []

    @language_ary = []

    if params[:orientation].nil? and params[:semester].nil? and params[:programming_language_ids].nil? and params[:country].nil?
      @internships = Internship.find(:all, :include => [:company, :semester, :orientation, :programming_languages]).sort_by do |x| x.created_at end
    else
      @internships = @quicksearch.internships(params)
    end

    @companies = @internships.collect do |x| x.company end

    @orientations_ary = @internships.collect do |x| x.orientation end

    @internships.each do |i|
      i.programming_languages.each do |p|
        @language_ary << p
      end
    end

		@pins = @companies.to_gmaps4rails do |company, marker |
      if company.website
        href =  if company.website.starts_with?'http' 
                company.website  
              else 
                "http://"+company.website 
              end
            end
      marker.infowindow ("<a href='/companies/#{company.id}' style='font-weight:bold'>#{company.name}</a><p>Industry: #{company.industry}</p><p>Employees: #{company.number_employees}</p><a href='#{href}' target='_blank'>#{company.website}</a>")

    end

    @semesters = @internships.collect do |x| x.semester end.map do |s|[s.semester,s.id] end

    @programming_languages = @language_ary.uniq.map do |p|[p.name, p.id] end

    @internships_size = @internships.size

    @bool = Internship.all.size == @internships_size

    @countries = (@companies.collect do |x| x.country end)
  
    @orientations = @orientations_ary.uniq.map do |o| [o.name, o.id] end

    ary = Array.new
    @countries.uniq.each do |x|
      ary << {:name=>x, :count=>@countries.count(x)}
    end
    @data_country = ary

    ary = Array.new
    @language_ary.uniq.each do |x|
      ary << {:name=>x.name, :count=>(@language_ary.count(x).to_f/@internships_size*100).to_i}
    end
    @data_language = ary

    ary = Array.new
    @orientations_ary.uniq.each do |x|
      ary << {:name=>x.name, :count=>@orientations_ary.count(x)}
    end
    @data_orientation = ary

    @countries = @countries.uniq
    @semesters = @semesters.uniq

    respond_to do |format|
      format.js { render :layout=>false, :locals => { :pins  => @pins, :internships => @internships } }
    end
  end

end
