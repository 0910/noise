class AddYoutubeToFestivals < ActiveRecord::Migration
  def change
  	add_column :festivals, :youtube, :string
  end
end
