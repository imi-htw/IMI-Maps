class ChangeReadingProfInInternshipRecord < ActiveRecord::Migration
  def change
    remove_column :internship_records, :report_reading_prof
    add_column :internship_records, :reading_prof_id, :integer  
  end
end
