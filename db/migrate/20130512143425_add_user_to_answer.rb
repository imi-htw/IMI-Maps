class AddUserToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :user_id, :integer
  end
end
