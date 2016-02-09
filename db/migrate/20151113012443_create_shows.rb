class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.datetime :starts_on
      t.datetime :finish_on
      t.text :description
      t.references :festival, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.string :slug, :unique => true

      t.timestamps null: false
    end
  end
end
