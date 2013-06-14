class ChangeSalaryIdToSalaryOnInternship < ActiveRecord::Migration
  def change
    remove_column :internships, :salary_id
    add_column :internships, :salary, :integer
  end
end
