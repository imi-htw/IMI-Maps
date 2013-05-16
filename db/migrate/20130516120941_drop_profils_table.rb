class DropProfilsTable < ActiveRecord::Migration
  def change
    drop_table :profils
  end
end
