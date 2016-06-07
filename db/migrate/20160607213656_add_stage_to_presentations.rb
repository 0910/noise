class AddStageToPresentations < ActiveRecord::Migration
  def change
    add_reference :presentations, :stage, index: true, foreign_key: true
  end
end
