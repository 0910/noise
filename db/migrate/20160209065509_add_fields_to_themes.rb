class AddFieldsToThemes < ActiveRecord::Migration
  def change
  	add_column :themes, :artists_title, :string
  	add_column :themes, :custom_artists_html, :text
  	add_column :themes, :custom_artists_css, :text
  	add_column :themes, :custom_artists_js, :text

  	add_column :themes, :events_title, :string
  	add_column :themes, :custom_events_html, :text
  	add_column :themes, :custom_events_css, :text
  	add_column :themes, :custom_events_js, :text

  	add_column :themes, :news_title, :string
  	add_column :themes, :custom_news_html, :text
  	add_column :themes, :custom_news_css, :text
  	add_column :themes, :custom_news_js, :text

  	add_column :themes, :videos_title, :string
  	add_column :themes, :custom_videos_html, :text
  	add_column :themes, :custom_videos_css, :text
  	add_column :themes, :custom_videos_js, :text

  	add_column :themes, :venues_title, :string
  	add_column :themes, :custom_venues_html, :text
  	add_column :themes, :custom_venues_css, :text
  	add_column :themes, :custom_venues_js, :text

  	add_column :themes, :shows_title, :string
  	add_column :themes, :custom_shows_html, :text
  	add_column :themes, :custom_shows_css, :text
  	add_column :themes, :custom_shows_js, :text
  end
end
