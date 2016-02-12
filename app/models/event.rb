class Event < ActiveRecord::Base
  belongs_to :festival, :dependent => :destroy

  belongs_to :venue, :dependent => :destroy

  has_many :shows

  has_attached_file :image, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>' },
            :url  => "/assets/events/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"
            
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :event_artists, :dependent => :destroy
  has_many :artists, :through => :event_artists

  extend FriendlyId
	friendly_id :name, use: :slugged

	def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end

end
