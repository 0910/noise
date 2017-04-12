class AddPressMenuTitleToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :menu_title_press, :string
  end
end
