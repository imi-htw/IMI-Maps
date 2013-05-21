class InternshipSearch < ActiveRecord::Base
  attr_accessible :city, :country, :industry, :max_salary, :min_salary, :orientation, :rating, :programming_language_ids, :search
  attr_accessor :programming_language_ids

  def internships
    @internships = find_internships
  end

  def internshipsAJAX
    @internships = find_AJAX
  end

private 
  
  def find_internships
    puts "Searching:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
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

  def find_AJAX
    internships = Internship.joins(:company).joins(:salary).joins(:programming_languages)
    internships_out += internships.where("internships_programming_languages.programming_language_id IN (?)", search)
    internships_out += internships.where('companies.country like ?', search)
    internships_out += internships.where('companies.city like ?', search)
    internships_out += internships.where('orientation like ?', search)
    internships_out += internships.where('industry like ?', search)
    internships_out
  end

end
