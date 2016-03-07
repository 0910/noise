class CreateSplashesTranslations < ActiveRecord::Migration
  def self.up
    Splash.create_translation_table!({
      :title => :text,
      :subtitle => :text,
      :call_to_action => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Splash.drop_translation_table! :migrate_data => true
  end
end
