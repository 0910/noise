class AddPressTitleTranslation < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        Festival.add_translation_fields! menu_title_press: :string
      end

      dir.down do
        remove_column :festivals_translations, :menu_title_press
      end
    end
  end
end
