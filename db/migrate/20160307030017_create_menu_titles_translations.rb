class CreateMenuTitlesTranslations < ActiveRecord::Migration
  def self.up
    Festival.create_translation_table!({
      :menu_title_home => :string,
      :menu_title_artists => :string,
      :menu_title_events => :string,
      :menu_title_news => :string,
      :menu_title_videos => :string,
      :menu_title_venues => :string,
      :menu_title_contacts => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Festival.drop_translation_table! :migrate_data => true
  end
end
