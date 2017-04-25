class AddGalleriesMenuTitleToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :menu_title_galleries, :string
  end
end
