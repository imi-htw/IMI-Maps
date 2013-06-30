class OverviewController < ApplicationController
  before_filter :authorize
  before_filter :get_programming_languages, :get_orientations

	def index

    @internships = Internship.find(:all, :include => [:company, :semester, :orientation, :programming_languages]).sort_by do |x| x.created_at end

    @companies = @internships.collect do |i| i.company end

#    @pins = @companies.to_gmaps4rails do |company, marker |
#
#      href =  if company.website.starts_with?'http' 
#              company.website  
#            else 
#              "http://"+company.website 
#             end
#             
#      marker.infowindow ("<a href='/companies/#{company.id}' style='font-weight:bold'>#{company.name}</a><p>Industry: #{company.industry}</p><p>Employees: #{company.number_employees}</p><a href='#{href}' target='_blank'>#{company.website}</a>")
#
#    end

    @programming_languages = ProgrammingLanguage.order(:name).where(:id => (Internship.joins(:programming_languages).select(:programming_language_id).collect do |x| x.programming_language_id end).uniq)

    @semesters = @internships.collect do |x| x.semester end.uniq

    @orientations = Orientation.all

    @countries = @companies.collect do |x| x.country end

    countries_uniq = @countries.uniq
    ary = Array.new
    countries_uniq.each do |x|
      ary << {:name=>x, :count=>@countries.count(x)}
    end
    @data_country = ary

    ary = Array.new
    @programming_languages.each do |x|
      s = x.try(:internships).try(:size)
      if s > 0
        ary << {:name=>x.name, :count=>s.to_f/@internships.size*100}
      end
    end
    @data_language = ary

    ary = Array.new
    @orientations.each do |x|
      s = x.internships.size
      if s > 0
        ary << {:name=>x.name, :count=>s}
      end
    end
    @data_orientation = ary

    @orientations = @orientations.map do |o| [o.name, o.id] end

    respond_to do |format|
      format.html
      format.js
    end
  end

end
