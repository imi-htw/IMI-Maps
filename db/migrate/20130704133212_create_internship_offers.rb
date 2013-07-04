class CreateInternshipOffers < ActiveRecord::Migration
  def change
    create_table :internship_offers do |t|
    	t.string :title
    	t.text :body
    	t.string :pdf

      t.timestamps
    end
  end
end
