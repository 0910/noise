class AddEndsToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :ends, :time
  end
end
