class AddFeaturedToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :featured, :string, :default => 'No'
  end
end
