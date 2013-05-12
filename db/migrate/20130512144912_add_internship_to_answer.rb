class AddInternshipToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :internship_id, :integer
  end
end
