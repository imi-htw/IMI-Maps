class RemoveProgrammingLanguageFromInternships < ActiveRecord::Migration
  def change
    remove_column :internships, :programming_language
  end
end
