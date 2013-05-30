class ChangeZipOfCompany < ActiveRecord::Migration
  def change  	
      change_column :companies, :zip, :string
  end
end
