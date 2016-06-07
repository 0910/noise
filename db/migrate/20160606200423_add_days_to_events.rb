class AddDaysToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :day, index: true, foreign_key: true
  end
end
