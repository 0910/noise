class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :link
      t.references :festival, index: true, foreign_key: true
      t.string :slug, :unique => true
      
      t.timestamps null: false
    end
  end
end
