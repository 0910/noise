class AddAttachmentsToTemplates < ActiveRecord::Migration
  def self.up
    change_table :templates do |t|
      t.attachment :home
      t.attachment :artists_index
      t.attachment :artists_show
      t.attachment :events_index
      t.attachment :events_show
      t.attachment :news_index
      t.attachment :news_show
      t.attachment :venues_index
      t.attachment :venues_show
      t.attachment :videos_index
      t.attachment :videos_show
    end
  end

  def self.down
    remove_attachment :templates, :home
    remove_attachment :templates, :artists_index
    remove_attachment :templates, :artists_show
    remove_attachment :templates, :events_index
    remove_attachment :templates, :events_show
    remove_attachment :templates, :news_index
    remove_attachment :templates, :news_show
    remove_attachment :templates, :venues_index
    remove_attachment :templates, :venues_show
    remove_attachment :templates, :videos_index
    remove_attachment :templates, :videos_show
  end
end
