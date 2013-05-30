class AddDescriptionAndSemesterToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :description, :text
    add_column :internships, :semester, :string
  end
end
