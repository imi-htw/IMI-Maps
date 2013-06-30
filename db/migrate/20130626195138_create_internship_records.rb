class CreateInternshipRecords < ActiveRecord::Migration
  def change
    create_table :internship_records do |t|
      t.string :supervisor_name
      t.string :supervisor_email
      t.string :comment
      t.string :report_reading_prof
      t.date :certificate_to_prof
      t.date :certificate_signed_by_prof
      t.date :certificate_signed_by_internship_officer
      t.integer :internship_state_id 
      t.integer :internship_id
      t.integer :payment_state_id
      t.integer :registration_state_id
      t.integer :contract_state_id
      t.integer :report_state_id
      t.integer :certificate_state_id

      t.timestamps
    end
  end
end
