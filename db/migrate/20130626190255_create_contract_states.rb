class CreateContractStates < ActiveRecord::Migration
  def change
    create_table :contract_states do |t|
      t.string :name
      t.string :name_de

      t.timestamps
    end
  end
end
