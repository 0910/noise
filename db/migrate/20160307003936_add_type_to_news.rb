class AddTypeToNews < ActiveRecord::Migration
  def change
    add_column :news, :type, :string
  end
end
