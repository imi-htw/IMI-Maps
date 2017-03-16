class QuicksearchesController < ApplicationController

	def index

		@quicksearch = Quicksearch.new

    @companies = []

    @orientations_ary = []

    @language_ary = []

    params[:country].delete_if(&:empty?) if params[:country].present?
    params[:semester].delete_if(&:empty?) if params[:semester].present?
    params[:programming_language_ids].delete_if(&:empty?) if params[:programming_language_ids].present?
    params[:orientation].delete_if(&:empty?) if params[:orientation].present?

    if !params[:orientation].present? and !params[:semester].present? and !params[:programming_language_ids].present? and !params[:country].present?
      @internships = Internship.includes(:company, :semester, :orientation, :programming_languages).where(completed: true).order('internships.created_at DESC')
    else
      @internships = @quicksearch.internships(params)
    end

    @internships.each do |i|
        i.programming_languages.each do |p|
          @language_ary << p
        end
      end
    @programming_languages = @language_ary.uniq

    @orientations_ary = @internships.collect do |x| x.orientation end
    @orientations = @orientations_ary.uniq.map do |o| [o.name, o.id] end

    @companies = @internships.collect do |x| x.company end

		@pins = @companies.to_gmaps4rails do |company, marker |
      if company.website
        href =  if company.website.starts_with?'http'
                company.website
              else
                "http://"+company.website
              end
            end
      marker.infowindow ("<a href='/internships/#{company.internships.first.id}' style='font-weight:bold'>#{company.internships.first.title} at #{company.name}</a><p>Industry: #{company.industry}</p><p>Employees: #{company.number_employees}</p><a href='#{href}' target='_blank'>#{company.website}</a>")

    end

    @semesters = @internships.collect do |x| x.semester end.map do |s|[s.name,s.id] end

    @internships_size = @internships.size

    @bool = Internship.where(completed: true).size == @internships_size

    @countries = (@companies.collect do |x| x.country end)

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
