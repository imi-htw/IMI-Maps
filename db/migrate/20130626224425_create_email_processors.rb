class CreateEmailProcessors < ActiveRecord::Migration
  def change
    create_table :email_processors do |t|

      t.timestamps
    end
  end
end
