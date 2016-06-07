class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :name
      t.text :description
      t.references :event, index: true, foreign_key: true
      t.references :festival, index: true, foreign_key: true
      t.references :artist, index: true, foreign_key: true
      t.datetime :starts_on
      t.datetime :finishes_on
      t.string :slug

      t.timestamps null: false
    end
  end
end
