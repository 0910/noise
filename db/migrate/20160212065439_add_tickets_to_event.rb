class AddTicketsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :tickets_link, :string
    add_column :events, :tickets_widget, :text
  end
end
