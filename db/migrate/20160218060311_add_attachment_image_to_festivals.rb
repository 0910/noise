class AddAttachmentImageToFestivals < ActiveRecord::Migration
  def self.up
    change_table :festivals do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :festivals, :image
  end
end
