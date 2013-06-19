class CreateFavoriteCompares < ActiveRecord::Migration
  def change
    create_table :favorite_compares do |t|

      t.timestamps
    end
  end
end
