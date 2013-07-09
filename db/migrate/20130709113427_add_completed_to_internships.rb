class AddCompletedToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :completed, :boolean, :default => false
  end
end
