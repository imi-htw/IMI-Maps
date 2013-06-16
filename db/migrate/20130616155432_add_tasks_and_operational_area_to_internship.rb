class AddTasksAndOperationalAreaToInternship < ActiveRecord::Migration
  def change
    add_column :internships, :tasks, :text
    add_column :internships, :operational_area, :string
  end
end
