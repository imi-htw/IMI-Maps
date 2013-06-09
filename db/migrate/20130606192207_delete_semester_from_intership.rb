class DeleteSemesterFromIntership < ActiveRecord::Migration
  def change
    remove_column :internships, :semester
  end
end
