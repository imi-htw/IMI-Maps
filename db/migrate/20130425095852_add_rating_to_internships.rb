class AddRatingToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :rating, :integer
  end
end
