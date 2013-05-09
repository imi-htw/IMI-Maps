class InternshipSearch < ActiveRecord::Base
  attr_accessible :city, :country, :industry, :max_salary, :min_salary, :orientation, :rating, :programming_language_ids
  attr_accessor :programming_language_ids

  def internships
    @internships = find_internships
  end

private 
  
  def find_internships
    internships = Internship.joins(:company).joins(:salary).joins(:programming_languages)
    internships = internships.where("internships_programming_languages.programming_language_id IN (?)", programming_language_ids) if programming_language_ids.present?
    internships = internships.where('companies.country like ?', country) if country.present?
    internships = internships.where('companies.city like ?', city) if city.present?
    internships = internships.where('orientation like ?', orientation) if orientation.present?
    internships = internships.where('industry like ?', industry) if industry.present?
    internships = internships.where(:rating => rating) if rating
    internships = internships.where('salaries.min_amount >= ?', min_salary) if min_salary
    internships = internships.where('salaries.max_amount <= ?', max_salary) if max_salary
    internships.uniq
  end

end
