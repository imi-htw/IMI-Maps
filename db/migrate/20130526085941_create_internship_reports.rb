class CreateInternshipReports < ActiveRecord::Migration
  def self.up
    create_table :internship_report do |t|
      t.string :data_file_name
      t.string :data_content_type
      t.integer :data_file_size
      t.integer :attachable_id
      t.string :attachable_type
      t.timestamps
    end

    add_index :internship_report, [:attachable_id, :attachable_type]
  end
  
  def self.down
    drop_table :internship_report
  end
end
