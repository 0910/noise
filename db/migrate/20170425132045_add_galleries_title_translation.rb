class AddGalleriesTitleTranslation < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        Festival.add_translation_fields! menu_title_galleries: :string
      end

      dir.down do
        remove_column :festivals_translations, :menu_title_galleries
      end
    end
  end
end
