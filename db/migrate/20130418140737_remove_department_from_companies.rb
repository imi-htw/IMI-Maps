class RemoveDepartmentFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :department
  end
end
