class AddCompanyIdToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :company_id, :integer
  end
end
