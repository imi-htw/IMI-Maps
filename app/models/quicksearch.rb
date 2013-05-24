class Quicksearch < ActiveRecord::Base
  
	def companies(query)
    #@internships = find_internships
    @companies = find_AJAX(query)
  end

  def internships(query)
    @internships = find_internships(query)
  end

  private

    def find_internships(query)
      if query.empty?      
        Internship.all
      else 
        Internship.joins(:orientation).where("orientations.name like ?","Design")
        internships = Internship.where("internships_programming_languages.programming_language_id IN (?)", query[:programming_language_ids]) if query[:programming_language_ids].present?
        internships = Internship.where('companies.country like ?', query[:country]) if query[:country].present?
        internships = Internship.where('orientations.name like ?', query[:orientation]) if query[:orientation].present?    
        internships 
      end
    end


    def find_AJAX(query)
      if query.empty?      
        Company.all
      else 
        companies_out = []
        companies_out += Company.where('country like ?',query)
        companies_out += Company.where('city like ?',query)
        companies_out += Company.where('street like ?',query)
        companies_out += Company.where('industry like ?',query)
        companies_out += Company.where('name like ?',query)
        companies_out
      end

    end

end
