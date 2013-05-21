class Quicksearch < ActiveRecord::Base
  
	def companies(query)
    #@internships = find_internships
    @companies = find_AJAX(query)
  end

   def find_AJAX(query)
   	companies_out = []
   	companies_out += Company.where('country like ?',query)
   	companies_out += Company.where('city like ?',query)
   	companies_out += Company.where('street like ?',query)
   	companies_out += Company.where('industry like ?',query)
   	companies_out += Company.where('name like ?',query)
   	companies_out
   	#internships = Internship.joins(:company).joins(:salary).joins(:programming_languages)
    #internships_out += internships.where("internships_programming_languages.programming_language_id IN (?)", search)
    #internships_out += internships.where('companies.country like ?', search)
    #internships_out += internships.where('companies.city like ?', search)
    #internships_out += internships.where('orientation like ?', search)
    #internships_out += internships.where('industry like ?', search)
    #internships_out
  end

end
