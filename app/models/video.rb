class Video < ActiveRecord::Base
	belongs_to :festival

	active_admin_translates :name, :description

	has_attached_file :image, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>' },
						:url  => "/assets/videos/:id/:style/:basename.:extension",
						:path => ":rails_root/public/assets/videos/:id/:style/:basename.:extension"
						
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	extend FriendlyId
	friendly_id :slug_candidates, use: :history

	def slug_candidates
	  [
	      [:id, :name]
	  ]
	end

  	after_commit :update_slug, on: :create

	def update_slug
		unless slug.include? self.id.to_s
			self.slug = nil
			self.save
		end
	end
end
