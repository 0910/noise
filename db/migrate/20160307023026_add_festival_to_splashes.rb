class AddFestivalToSplashes < ActiveRecord::Migration
  def change
    add_reference :splashes, :festival, index: true, foreign_key: true
  end
end
