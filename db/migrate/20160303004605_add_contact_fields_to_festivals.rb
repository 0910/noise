class AddContactFieldsToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :regular_contact_address, :string
    add_column :festivals, :press_contact_address, :string
  end
end
