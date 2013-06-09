class Quicksearch < ActiveRecord::Base  

  def internships(query)
    @internships = find_internships(query)
  end

  private

    def find_internships(query)
      if query.empty?      
        Internship.order("created_at DESC")
      else 
        internships = Internship.joins(:programming_languages).includes(:company)
        languages = query[:programming_language_ids].collect{|s| s.to_i} if query[:programming_language_ids].present?
        orientations = query[:orientation].collect{|s| s.to_i} if query[:orientation].present?
        semesters = query[:semester].collect{|s| s.to_i} if query[:semester].present?
        internships = internships.where(:internships_programming_languages => {:programming_language_id => languages}) if languages.present?
        internships = internships.where(:companies => {:country => query[:country]}) if query[:country].present?
        internships = internships.where(:orientation_id => orientations) if orientations.present?
        internships = internships.where(:semester_id => semesters) if semesters.present?
        internships.uniq
      end
    end


    

end
