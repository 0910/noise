class AddFestivalToImages < ActiveRecord::Migration
  def change
    add_reference :images, :festival, index: true, foreign_key: true
  end
end
