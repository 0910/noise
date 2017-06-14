class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :body
      t.references :festival, index: true, foreign_key: true
      t.string :slug, :unique => true
      t.timestamps null: false
    end
  end
end
