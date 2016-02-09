class Event < ActiveRecord::Base
  belongs_to :festival, :dependent => :destroy

  belongs_to :venue, :dependent => :destroy

  has_many :shows

  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

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
