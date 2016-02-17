class AddAttachmentLogoToFestivals < ActiveRecord::Migration
  def self.up
    change_table :festivals do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :festivals, :logo
  end
end
