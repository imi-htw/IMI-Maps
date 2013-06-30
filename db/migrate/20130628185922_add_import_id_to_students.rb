class AddImportIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :import_id, :integer
  end
end
