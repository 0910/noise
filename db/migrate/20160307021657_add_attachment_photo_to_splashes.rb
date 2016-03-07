class AddAttachmentPhotoToSplashes < ActiveRecord::Migration
  def self.up
    change_table :splashes do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :splashes, :photo
  end
end
