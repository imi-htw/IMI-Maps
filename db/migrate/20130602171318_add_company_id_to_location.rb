class AddCompanyIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :company_id, :integer
  end
end
