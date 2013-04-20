class AddMainLanguageToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :main_language, :string
  end
end
