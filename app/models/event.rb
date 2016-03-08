class Event < ActiveRecord::Base
  belongs_to :festival

  belongs_to :venue

  has_many :shows

  active_admin_translates :description

  has_attached_file :image, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>' },
            :url  => "/assets/events/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"
            
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :event_artists, :dependent => :destroy
  has_many :artists, :through => :event_artists

  #has_many :event_artists, :dependent => :destroy
  accepts_nested_attributes_for :event_artists, :allow_destroy => true

  extend FriendlyId
	friendly_id :name, use: :slugged

	def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end

end
