class AddPublishedToFestival < ActiveRecord::Migration
  def change
    add_column :festivals, :published, :boolean
  end
end
