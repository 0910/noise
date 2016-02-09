class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string   :file_file_name
      t.string   :file_content_type
      t.integer  :file_file_size
      t.datetime :file_updated_at
      t.references  :event, index: true, foreign_key: true
      t.references  :venue, index: true, foreign_key: true
      t.references  :show, index: true, foreign_key: true
      t.references  :artist, index: true, foreign_key: true
      t.references  :news, index: true, foreign_key: true
      t.boolean :cover, :default => false
      t.timestamps null: false
    end
  end
end
