class AddSponsorsMenuTitleToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :menu_title_sponsors, :string
  end
end
