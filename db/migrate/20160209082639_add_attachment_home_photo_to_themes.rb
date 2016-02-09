class AddAttachmentHomePhotoToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :home_photo
    end
  end

  def self.down
    remove_attachment :themes, :home_photo
  end
end
