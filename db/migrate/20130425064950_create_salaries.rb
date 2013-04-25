class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.string :amount
      t.integer :order_id

      t.timestamps
    end
  end
end
