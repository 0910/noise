class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :name
      t.date :date
      t.references :festival, index: true, foreign_key: true
      t.string :slug

      t.timestamps null: false
    end
  end
end
