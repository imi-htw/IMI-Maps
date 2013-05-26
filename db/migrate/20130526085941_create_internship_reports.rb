class CreateInternshipReports < ActiveRecord::Migration
  def change
    create_table :internship_reports do |t|

      t.timestamps
    end
  end
end
