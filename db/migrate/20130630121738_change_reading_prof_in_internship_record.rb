class ChangeReadingProfInInternshipRecord < ActiveRecord::Migration
  def change
    rename_column :internship_records, :report_reading_prof, :reading_prof_id
    change_column :internship_records, :reading_prof_id, :integer  
  end
end
