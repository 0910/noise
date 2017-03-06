class AddStagesToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :stage, index: true, foreign_key: true
  end
end
