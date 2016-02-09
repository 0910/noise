class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.integer :capacity
      t.text :description
      t.string :slug, :unique => true
      t.references :festival, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
