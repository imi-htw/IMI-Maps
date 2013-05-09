class AddInternshipToComments < ActiveRecord::Migration
  def change
    add_column :comments, :internship_id, :integer  
  end
end
