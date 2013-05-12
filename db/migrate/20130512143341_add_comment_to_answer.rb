class AddCommentToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :comment_id, :integer  
  end
end
