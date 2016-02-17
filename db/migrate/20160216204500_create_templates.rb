class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.text :name
      t.text :body
      t.boolean :partial, :default => false
      t.string :path
      t.string :format, :default => 'html'
      t.string :locale
      t.string :handler, :default => 'curly'
      t.references :festival, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
