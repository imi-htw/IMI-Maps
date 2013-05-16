class CreateProfils < ActiveRecord::Migration
  def change
    create_table :profils do |t|
      t.string :nachname
      t.string :vorname
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
