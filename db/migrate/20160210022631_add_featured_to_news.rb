class AddFeaturedToNews < ActiveRecord::Migration
  def change
    add_column :news, :featured, :string, :default => 'No'
  end
end
