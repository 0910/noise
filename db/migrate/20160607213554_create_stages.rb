class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :name
      t.references :day, index: true, foreign_key: true
      t.references :festival, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
