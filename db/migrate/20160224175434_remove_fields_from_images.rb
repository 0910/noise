class RemoveFieldsFromImages < ActiveRecord::Migration
  def change
  	remove_foreign_key :images, :news
  	remove_foreign_key :images, :artist
  	remove_foreign_key :images, :venue
  	remove_foreign_key :images, :event
  	remove_foreign_key :images, :sponsor
  	remove_foreign_key :images, :video
  	remove_index :images, :news_id
  	remove_index :images, :artist_id
  	remove_index :images, :venue_id
  	remove_index :images, :event_id
  	remove_index :images, :sponsor_id
  	remove_index :images, :video_id
  	remove_column :images, :news_id
  	remove_column :images, :artist_id
  	remove_column :images, :venue_id
  	remove_column :images, :event_id
  	remove_column :images, :sponsor_id
  	remove_column :images, :video_id

  end
end
