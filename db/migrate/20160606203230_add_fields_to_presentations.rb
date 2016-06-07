class AddFieldsToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :time, :time
    add_column :presentations, :duration, :integer
  end
end
