class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.string :orientation
      t.string :programming_language
      t.float :salary
      t.float :working_hours
      t.float :living_costs
      t.timestamps
    end
  end
end
