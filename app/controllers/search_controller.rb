class SearchController < ApplicationController
  before_filter :authorize

  def index

    @internships = Internship.all

    @companies = @internships.collect do |x| x.company end

    @countries = @companies.collect do |x| x.country end.uniq

  	@programming_languages = ProgrammingLanguage.order(:name).where(:id => (Internship.joins(:programming_languages).select(:programming_language_id).collect do |x| x.programming_language_id end).uniq).map do |p|
        [p.name, p.id]
      end

    @semesters = Semester.where(:id =>(@internships.collect do |x| x.semester_id end.uniq)).map do |s| [s.semester, s.id] end

    @orientations = (Orientation.where(:id => @internships.collect do |x| x.orientation_id end)).uniq.map do |o| [o.name, o.id] end

    @working_hours_max = @internships.collect do |x| x.working_hours end.max

    @living_costs_max = @internships.collect do |x| x.living_costs end.max

    @salary_max = @internships.collect do |x| x.salary end.max


  end

end
