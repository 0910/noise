class Artist < ActiveRecord::Base
	acts_as_list
	belongs_to :festival
	has_many :show

	active_admin_translates :bio

	has_attached_file :image, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>', :high => '1920x1080>' },
						:url  => "/assets/artists/:id/:style/:basename.:extension",
						:path => ":rails_root/public/assets/artists/:id/:style/:basename.:extension"
						
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	has_many :event_artists, :dependent => :destroy
	has_many :events, :through => :event_artists

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
