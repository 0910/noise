class AddSponsorsToImages < ActiveRecord::Migration
  def change
    add_reference :images, :sponsor, index: true, foreign_key: true
  end
end
