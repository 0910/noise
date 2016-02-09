class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.references :festival, index: true, foreign_key: true
      t.text :custom_html
      t.text :custom_html_preview
      t.text :custom_css
      t.text :custom_css_preview
      t.text :custom_js
      t.text :custom_js_preview

      t.timestamps null: false
    end
  end
end
