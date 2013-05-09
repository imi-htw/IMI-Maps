class RemovePostAndCommenterFromComments < ActiveRecord::Migration
  def change
     remove_column :comments, :commenter 
     remove_column :comments, :post_id
  end
end
