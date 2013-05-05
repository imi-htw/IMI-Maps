class AddMinAndMaxToSalaries < ActiveRecord::Migration
  def change
    add_column :salaries, :min_amount, :integer
    add_column :salaries, :max_amount, :integer
  end
end
