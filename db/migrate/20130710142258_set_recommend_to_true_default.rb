class SetRecommendToTrueDefault < ActiveRecord::Migration
  def change  	
      change_column :internships, :recommend, :boolean, :default => true
  end
end
