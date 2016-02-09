class AddAttachmentVenuesPhotoToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :venues_photo
    end
  end

  def self.down
    remove_attachment :themes, :venues_photo
  end
end
