class CreateCompaniesCompares < ActiveRecord::Migration
  def change
    create_table :companies_compares do |t|

      t.timestamps
    end
  end
end
