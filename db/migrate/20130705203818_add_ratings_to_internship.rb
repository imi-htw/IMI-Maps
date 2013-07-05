class AddRatingsToInternship < ActiveRecord::Migration
  def change
  	add_column :internships, :tasks_rating, :integer
  	add_column :internships, :training_rating, :integer
  	add_column :internships, :atmosphere_rating, :integer
  	add_column :internships, :supervision_rating, :integer
  	add_column :internships, :appreciation_rating, :integer
  end
end
