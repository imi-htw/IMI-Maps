class OverviewController < ApplicationController
  before_filter :authorize
  before_filter :get_programming_languages, :get_orientations

  def index
    @internships = Internship.includes(:company, :semester, :orientation, :programming_languages).where(completed: true).order('created_at DESC')
    @companies = @internships.map(&:company)

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

    @programming_languages = @internships.map(&:programming_languages)

    @semesters = @internships.map(&:semester)

    @orientations_ary = @internships.map(&:orientation).compact.uniq

    @orientations = @orientations_ary.map { |o| [o.name, o.id] }

    @countries = @companies.map(&:country).compact.uniq

    @data_country = []
    @countries.each do |x|
      @data_country << {:name=>x, :count=>@countries.count(x)}
    end

    @data_language = []
    @programming_languages.each do |x|
      s = x.try(:internships).try(:size)
      if s > 0
        @data_language << {:name=>x.name, :count=>s.to_f/@internships.size*100}
      end
    end


    @data_orientation = []
    @orientations_ary.each do |x|
      @data_orientation << {:name=>x.name, :count=>@orientations_ary.count(x)}
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

end
