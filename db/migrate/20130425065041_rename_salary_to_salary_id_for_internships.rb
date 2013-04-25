class RenameSalaryToSalaryIdForInternships < ActiveRecord::Migration
    def change
      rename_column :internships, :salary, :salary_id
      change_column :internships, :salary_id, :integer
    end
end
