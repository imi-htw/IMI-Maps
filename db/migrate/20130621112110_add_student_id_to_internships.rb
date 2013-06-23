class AddStudentIdToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :student_id, :integer
  end
end
