class AddEmailPublicToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :email_public, :boolean
  end
end
