class AddNewsReferencesToImages < ActiveRecord::Migration
  def change
    add_reference :images, :news, index: true, foreign_key: true
  end
end
