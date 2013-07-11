class RemoveInternshipAuthorizationFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :internship_authorization
  end
end
