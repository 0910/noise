class Artist < ActiveRecord::Base
	belongs_to :festival, :dependent => :destroy
	has_many :show

	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :allow_destroy => true

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
