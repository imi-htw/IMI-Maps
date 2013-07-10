class AddInternshipRecordAttributesToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :internship_state_id, :integer
    add_column :internships, :reading_prof_id, :integer
    add_column :internships, :payment_state_id, :integer
    add_column :internships, :registration_state_id, :integer
    add_column :internships, :contract_state_id, :integer
    add_column :internships, :report_state_id, :integer
    add_column :internships, :certificate_state_id, :integer
    add_column :internships, :certificate_signed_by_internship_officer, :date
    add_column :internships, :certificate_signed_by_prof, :date
    add_column :internships, :certificate_to_prof, :date
    add_column :internships, :comment, :string
    add_column :internships, :supervisor_email, :string
    add_column :internships, :supervisor_name, :string
  end
end
