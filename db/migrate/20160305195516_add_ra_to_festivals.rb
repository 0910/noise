class AddRaToFestivals < ActiveRecord::Migration
  def change
  	add_column :festivals, :ra_link, :string
  end
end
