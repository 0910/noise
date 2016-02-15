class Artist < ActiveRecord::Base
	belongs_to :festival, :dependent => :destroy
	has_many :show

	active_admin_translates :bio

	has_attached_file :image, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>' },
						:url  => "/assets/artists/:id/:style/:basename.:extension",
						:path => ":rails_root/public/assets/artists/:id/:style/:basename.:extension"
						
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	has_many :event_artists, :dependent => :destroy
	has_many :events, :through => :event_artists

	extend FriendlyId
	friendly_id :name, use: :slugged

	def slug_candidates
    [
      :name,
      [:current_festival, :name]
    ]
  end
end
