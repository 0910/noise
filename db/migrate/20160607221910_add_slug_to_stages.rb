class AddSlugToStages < ActiveRecord::Migration
  def change
    add_column :stages, :slug, :string
  end
end
