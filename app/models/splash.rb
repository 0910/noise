class Splash < ActiveRecord::Base

  belongs_to :festival

  active_admin_translates :title, :subtitle, :call_to_action

  has_attached_file :photo, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>', :high => '1920x1080>' },
    :url  => "/assets/splashes/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/splashes/:id/:style/:basename.:extension"
            
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
