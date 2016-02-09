class AddMoreModulesToThemes < ActiveRecord::Migration
  def change
  	add_column :themes, :custom_nav_html, :text
  	add_column :themes, :custom_nav_css, :text
  	add_column :themes, :custom_nav_js, :text

  	add_column :themes, :custom_footer_html, :text
  	add_column :themes, :custom_footer_css, :text
  	add_column :themes, :custom_footer_js, :text
  end
end
