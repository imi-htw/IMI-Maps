class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|

      t.timestamps
    end
  end
end
