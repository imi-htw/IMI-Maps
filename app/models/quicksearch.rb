class Quicksearch < ActiveRecord::Base  

  def internships(query)
    @internships = find_internships(query)
  end

  private

    def find_internships(query)
      internships = Internship.includes(:company)
      if query[:programming_language_ids].present?
        internships_ary = []
        languages = query[:programming_language_ids].collect{|s| s.to_i} if query[:programming_language_ids].present?
        programming_languages = ProgrammingLanguage.find(languages)
        programming_languages.each do |x|
          if internships_ary.empty?
            internships_ary = x.internships.collect do |s| s.id end
          else
            internships_ary = internships_ary & x.internships.collect do |s| s.id end
          end
        end
        internships = internships.where(:id => internships_ary)
      end
      orientations = query[:orientation].collect{|s| s.to_i} if query[:orientation].present?
      semesters = query[:semester].collect{|s| s.to_i} if query[:semester].present?
      internships = internships.where(:companies => {:country => query[:country]}) if query[:country].present?
      internships = internships.where(:orientation_id => orientations) if orientations.present?
      internships = internships.where(:semester_id => semesters) if semesters.present?
      #binding.pry
      internships.uniq
    end
    
end   
