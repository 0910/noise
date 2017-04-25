class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.references :festival, index: true, foreign_key: true
      t.string :slug, :unique => true

      t.timestamps null: false
    end
  end
end
