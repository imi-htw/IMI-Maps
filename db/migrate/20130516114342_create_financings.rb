class CreateFinancings < ActiveRecord::Migration
  def change
    create_table :financings do |t|

      t.timestamps
    end
  end
end
