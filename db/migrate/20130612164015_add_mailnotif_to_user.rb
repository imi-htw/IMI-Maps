class AddMailnotifToUser < ActiveRecord::Migration
  def change
    add_column :users, :mailnotif, :boolean
  end
end
