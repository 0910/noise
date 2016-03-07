class AddMenuTitlesToFestivals < ActiveRecord::Migration
  def change
  	add_column :festivals, :menu_title_home, :string
  	add_column :festivals, :menu_title_artists, :string
  	add_column :festivals, :menu_title_events, :string
  	add_column :festivals, :menu_title_news, :string
  	add_column :festivals, :menu_title_videos, :string
  	add_column :festivals, :menu_title_venues, :string
  	add_column :festivals, :menu_title_contacts, :string
  end
end
