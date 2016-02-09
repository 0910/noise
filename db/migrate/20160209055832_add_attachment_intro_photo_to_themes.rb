class AddAttachmentIntroPhotoToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :intro_photo
    end
  end

  def self.down
    remove_attachment :themes, :intro_photo
  end
end
