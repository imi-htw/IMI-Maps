class ChangeRatingToDefaultOne < ActiveRecord::Migration
  def change  	
      change_column :internships, :rating, :integer, :default => 1
  end
end
