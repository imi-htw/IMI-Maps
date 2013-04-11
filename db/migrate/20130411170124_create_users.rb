class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :major
      t.string :email
      t.string :role

      t.timestamps
    end
  end
end
