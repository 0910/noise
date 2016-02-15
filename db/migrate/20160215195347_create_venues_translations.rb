class CreateVenuesTranslations < ActiveRecord::Migration
  def self.up
    Venue.create_translation_table!({
      :description => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Venue.drop_translation_table! :migrate_data => true
  end
end
