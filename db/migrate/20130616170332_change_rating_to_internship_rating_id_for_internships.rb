class ChangeRatingToInternshipRatingIdForInternships < ActiveRecord::Migration
  def change
    rename_column :internships, :rating, :internship_rating_id  
  end
end
