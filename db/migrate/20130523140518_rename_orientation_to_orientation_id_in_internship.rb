class RenameOrientationToOrientationIdInInternship < ActiveRecord::Migration
  def change
      rename_column :internships, :orientation, :orientation_id
      change_column :internships, :orientation_id, :integer
    end
end
