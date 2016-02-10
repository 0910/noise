class RemoveModulesFromThemes < ActiveRecord::Migration
  def change
  	remove_column :themes, :artists_title
  	remove_column :themes, :custom_artists_html
  	remove_column :themes, :custom_artists_css
  	remove_column :themes, :custom_artists_js

  	remove_column :themes, :events_title
  	remove_column :themes, :custom_events_html
  	remove_column :themes, :custom_events_css
  	remove_column :themes, :custom_events_js

  	remove_column :themes, :news_title, :string
  	remove_column :themes, :custom_news_html
  	remove_column :themes, :custom_news_css
  	remove_column :themes, :custom_news_js

  	remove_column :themes, :videos_title, :string
  	remove_column :themes, :custom_videos_html
  	remove_column :themes, :custom_videos_css
  	remove_column :themes, :custom_videos_js

  	remove_column :themes, :venues_title, :string
  	remove_column :themes, :custom_venues_html
  	remove_column :themes, :custom_venues_css
  	remove_column :themes, :custom_venues_js

  	remove_column :themes, :shows_title, :string
  	remove_column :themes, :custom_shows_html
  	remove_column :themes, :custom_shows_css
  	remove_column :themes, :custom_shows_js

  	remove_column :themes, :custom_nav_html
  	remove_column :themes, :custom_nav_css
  	remove_column :themes, :custom_nav_js

  	remove_column :themes, :custom_footer_html
  	remove_column :themes, :custom_footer_css
  	remove_column :themes, :custom_footer_js
  end
end
