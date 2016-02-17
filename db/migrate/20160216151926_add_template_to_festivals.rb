class AddTemplateToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :template, :text
  end
end
