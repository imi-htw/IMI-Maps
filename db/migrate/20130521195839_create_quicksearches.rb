class CreateQuicksearches < ActiveRecord::Migration
  def change
    create_table :quicksearches do |t|

      t.timestamps
    end
  end
end
