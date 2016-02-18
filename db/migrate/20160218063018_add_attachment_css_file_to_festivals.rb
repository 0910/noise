class AddAttachmentCssFileToFestivals < ActiveRecord::Migration
  def self.up
    change_table :festivals do |t|
      t.attachment :css_file
    end
  end

  def self.down
    remove_attachment :festivals, :css_file
  end
end
