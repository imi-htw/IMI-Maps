class AddPublicmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :publicmail, :boolean
  end
end
