class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :starts_on
      t.datetime :finish_on
      t.text :description
      t.string :slug, :unique => true
      t.references :festival, index: true, foreign_key: true
      t.references :venue, index: true, foreign_key: true
      t.string :tickets

      t.timestamps null: false
    end
  end
end
