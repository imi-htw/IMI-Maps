class CreateInternshipRatings < ActiveRecord::Migration
  def change
    create_table :internship_ratings do |t|
      t.integer :tasks, :limit => 1
      t.integer :training_success, :limit => 1
      t.integer :atmosphere, :limit => 1
      t.integer :supervision, :limit => 1
      t.integer :appreciation, :limit => 1

      t.timestamps
    end
  end
end
