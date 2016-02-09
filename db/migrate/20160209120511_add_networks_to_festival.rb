class AddNetworksToFestival < ActiveRecord::Migration
  def change
    add_column :festivals, :facebook, :string
    add_column :festivals, :twitter, :string
    add_column :festivals, :instagram, :string
    add_column :festivals, :resident, :string
    add_column :festivals, :soundcloud, :string
  end
end
