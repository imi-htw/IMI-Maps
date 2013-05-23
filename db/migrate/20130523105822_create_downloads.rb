class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|

      t.timestamps
    end
  end
end
