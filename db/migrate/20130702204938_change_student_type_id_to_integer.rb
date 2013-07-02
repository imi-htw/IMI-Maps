class ChangeStudentTypeIdToInteger < ActiveRecord::Migration
  def up
    remove_column :users, :student_id
    add_column :users, :student_id, :integer
  end

  def down
    remove_column :users, :student_id
    add_column :users, :student_id, :string
  end
end
