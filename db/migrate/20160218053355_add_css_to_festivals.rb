class AddCssToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :css, :text
  end
end
