class AddCompareboxToFavorite < ActiveRecord::Migration
  def change
    add_column :favorites, :comparebox, :boolean
  end
end
