class AddAttachmentNewsPhotoToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :news_photo
    end
  end

  def self.down
    remove_attachment :themes, :news_photo
  end
end
