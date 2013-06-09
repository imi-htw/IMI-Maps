class AddSemesterIdToInternship < ActiveRecord::Migration
  def change
    add_column :internships, :semester_id, :integer
  end
end
