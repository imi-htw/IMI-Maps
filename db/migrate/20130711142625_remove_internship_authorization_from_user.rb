class RemoveInternshipAuthorizationFromUser < ActiveRecord::Migration
  def change
    remove_column :internships, :internship_authorization
  end
end
