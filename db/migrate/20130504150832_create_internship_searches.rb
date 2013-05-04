class CreateInternshipSearches < ActiveRecord::Migration
  def change
    create_table :internship_searches do |t|
      t.string :country
      t.string :city
      t.string :industry
      t.string :orientation
      t.integer :min_salary
      t.integer :max_salary
      t.integer :rating

      t.timestamps
    end
  end
end
