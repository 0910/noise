class AddPositionToEventArtists < ActiveRecord::Migration
  def change
    add_column :event_artists, :position, :integer
  end
end
