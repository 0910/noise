class Event < ActiveRecord::Base
  belongs_to :festival
  belongs_to :day
  belongs_to :venue
  has_many :presentations

  active_admin_translates :description

  has_attached_file :image, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>', :high => '1920x1080>' },
            :url  => "/assets/events/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"
            
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :event_artists, :dependent => :destroy
  has_many :artists, :through => :event_artists

  #has_many :event_artists, :dependent => :destroy
  accepts_nested_attributes_for :event_artists, :allow_destroy => true

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
