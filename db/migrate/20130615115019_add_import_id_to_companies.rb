class AddImportIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :import_id, :integer
  end
end
