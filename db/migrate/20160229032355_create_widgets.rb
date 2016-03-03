class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :name
      t.text :code
      t.references :festival, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
