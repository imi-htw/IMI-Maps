class RenameOrientationToOrientationIdInInternship < ActiveRecord::Migration
  def change
      remove_column :internships, :orientation
      add_column :internships, :orientation_id, :integer
    end
end
