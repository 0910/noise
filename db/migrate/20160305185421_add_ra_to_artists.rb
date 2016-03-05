class AddRaToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :ra_link, :string
  end
end
