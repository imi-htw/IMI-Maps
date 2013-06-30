class RemoveContactPeople < ActiveRecord::Migration
  def change
    drop_table :contact_people
  end
end
