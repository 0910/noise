class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :country
      t.text :bio
      t.string :facebook_link
      t.string :soundcloud_link
      t.string :twitter_link
      t.string :instagram_link
      t.string :youtube_link
      t.string :beatport_link
      t.references :festival, index: true, foreign_key: true
      t.string :slug, :unique => true

      t.timestamps null: false
    end
  end
end
