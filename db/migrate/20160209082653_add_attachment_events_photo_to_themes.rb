class AddAttachmentEventsPhotoToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :events_photo
    end
  end

  def self.down
    remove_attachment :themes, :events_photo
  end
end
