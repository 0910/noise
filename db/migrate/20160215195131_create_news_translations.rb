class CreateNewsTranslations < ActiveRecord::Migration
  def self.up
    News.create_translation_table!({
      :title => :string,
      :subtitle => :string,
      :body => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    News.drop_translation_table! :migrate_data => true
  end
end
