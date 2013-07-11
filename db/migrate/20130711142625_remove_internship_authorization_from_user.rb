class RemoveInternshipAuthorizationFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :internship_authorization
  end

  def down
    add_column :users, :internship_authorization, :boolean
  end
end
