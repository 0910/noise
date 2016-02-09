class AddThemeToFestivals < ActiveRecord::Migration
  def change
    add_reference :festivals, :theme, index: true, foreign_key: true
  end
end
