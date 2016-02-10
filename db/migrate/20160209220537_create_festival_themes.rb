class CreateFestivalThemes < ActiveRecord::Migration
  def change
    create_table :festival_themes do |t|
      t.references :festival, index: true, foreign_key: true
      t.references :theme, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
