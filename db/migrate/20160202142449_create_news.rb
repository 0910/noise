class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :subtitle
      t.date :date
      t.text :body
      t.references :festival, index: true, foreign_key: true
      t.string :slug, :unique => true

      t.timestamps null: false
    end
  end
end
