class AddRecommendToInternship < ActiveRecord::Migration
  def change
    add_column :internships, :recommend, :boolean
  end
end
