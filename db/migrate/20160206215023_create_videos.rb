class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.text :description
      t.text :link
      t.references :festival, index: true, foreign_key: true
      t.string :slug, :unique => true

      t.timestamps null: false
    end
  end
end
