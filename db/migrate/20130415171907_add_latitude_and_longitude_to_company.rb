class AddLatitudeAndLongitudeToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :latitue, :float
    add_column :companies, :longitude, :float
  end
end
