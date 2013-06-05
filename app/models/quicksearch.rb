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
        internships = Internship.joins(:programming_languages).includes(:company)
        languages = query[:programming_language_ids].collect{|s| s.to_i} if query[:programming_language_ids].present?
        orientations = query[:orientation].collect{|s| s.to_i} if query[:orientation].present?
        internships = internships.where(:internships_programming_languages => {:programming_language_id => languages}) if languages.present?
        internships = internships.where(:companies => {:country => query[:country]}) if query[:country].present?
        internships = internships.where(:orientation_id => orientations) if orientations.present?
        binding.pry
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
