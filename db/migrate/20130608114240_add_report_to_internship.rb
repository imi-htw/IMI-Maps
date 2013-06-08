class AddReportToInternship < ActiveRecord::Migration
  def change
    add_column :internships, :internship_report, :string
  end
end
