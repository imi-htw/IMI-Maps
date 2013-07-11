class OverviewController < ApplicationController
  before_filter :authorize
  before_filter :get_programming_languages, :get_orientations

  def index
    @internships = Internship.includes(:company, :semester, :orientation, :programming_languages).where(completed: true).order('created_at DESC')
    @companies = @internships.map(&:company)

    @pins = @companies.to_gmaps4rails do |company, marker |
      marker.infowindow ("<a href='/internships/#{company.internships.first.id}' style='font-weight:bold'>#{company.internships.first.title} at #{company.name}</a>")
    end

    @programming_languages = ProgrammingLanguage.order(:name).where(:id => (Internship.joins(:programming_languages).select(:programming_language_id).collect do |x| x.programming_language_id end).uniq)

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
