class AddAttachmentVideosPhotoToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :videos_photo
    end
  end

  def self.down
    remove_attachment :themes, :videos_photo
  end
end
