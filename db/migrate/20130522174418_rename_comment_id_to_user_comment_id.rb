class RenameCommentIdToUserCommentId < ActiveRecord::Migration
  def change  	
      rename_column :answers, :comment_id, :user_comment_id
  end
end
