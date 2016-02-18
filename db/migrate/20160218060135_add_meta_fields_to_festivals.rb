class AddMetaFieldsToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :url, :string
    add_column :festivals, :keywords, :string
  end
end
