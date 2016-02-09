class AddAttachmentArtistsPhotoToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :artists_photo
    end
  end

  def self.down
    remove_attachment :themes, :artists_photo
  end
end
