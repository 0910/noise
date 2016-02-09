class AddAttachmentShowsPhotoToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :shows_photo
    end
  end

  def self.down
    remove_attachment :themes, :shows_photo
  end
end
