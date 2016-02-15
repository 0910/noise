class Video < ActiveRecord::Base
	belongs_to :festival, :dependent => :destroy

	active_admin_translates :name, :description

	has_attached_file :image, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>' },
						:url  => "/assets/videos/:id/:style/:basename.:extension",
						:path => ":rails_root/public/assets/videos/:id/:style/:basename.:extension"
						
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	extend FriendlyId
	friendly_id :name, use: :slugged

	def slug_candidates
		[
			:name,
			[:name, :id]
		]
	end
end
