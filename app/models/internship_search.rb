class InternshipSearch < ActiveRecord::Base
  attr_accessible :city, :country, :industry, :max_salary, :min_salary, :orientation, :rating

  def internships
    @internships || = find_internships
  end

private 
  
  def find_internships
    internships = Internship.includes(:company)
    internships = internships.where('companies.country like ?', country)
    internships = internships.where('companies.city like ?', city)
    internships = internships.where('orientation like ?', orientation)
    internships = internships.where('industry like ?', industry)
    internships = internships.where(:rating => rating)
    internships
  end
end
