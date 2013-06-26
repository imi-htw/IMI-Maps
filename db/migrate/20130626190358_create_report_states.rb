class CreateReportStates < ActiveRecord::Migration
  def change
    create_table :report_states do |t|
      t.string :name
      t.string :name_de

      t.timestamps
    end
  end
end
