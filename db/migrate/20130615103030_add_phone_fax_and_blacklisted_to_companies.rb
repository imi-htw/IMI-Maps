class AddPhoneFaxAndBlacklistedToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :phone, :string
    add_column :companies, :fax, :string
    add_column :companies, :blacklisted, :boolean, :default => false
  end
end
