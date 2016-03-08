class Image < ActiveRecord::Base
	has_attached_file :file, :styles => {:thumb => '120x80>', :small => '480x320>', :medium => '720x480>', :large => '1080x720>', :original => ''}, :url  => "/assets/images/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/images/:id/:style/:basename.:extension"

	validates_attachment :file, presence: true, content_type: { content_type: ['image/jpg', 'image/png', 'image/gif', 'image/jpeg'] }

	belongs_to :festival
	belongs_to :news
end
