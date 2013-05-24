class AddIndexToInternshipProgrammingLanguages < ActiveRecord::Migration
  def change
  	add_index(:internships_programming_languages, [:programming_language_id, :internship_id], :unique => true, :name => 'unique_index')
	end
end
