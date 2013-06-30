class CreateReadingProf < ActiveRecord::Migration
  def change
    create_table :reading_profs do |t|
      t.string :name

      t.timestamps
    end
  end
end
