class ChangeStudentIdTypeToInteger < ActiveRecord::Migration
  def change
    change_column :users, :student_id, :integer
  end
end
