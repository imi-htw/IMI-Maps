class AddInternshipAuthorizationToUser < ActiveRecord::Migration
  def change
    add_column :users, :internship_authorization, :boolean, :default => true
  end
end
