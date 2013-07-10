class ChangeSemesterToName < ActiveRecord::Migration
  def change
    rename_column :semesters, :semester, :name  
  end
end
