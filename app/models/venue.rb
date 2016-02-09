class Venue < ActiveRecord::Base
	belongs_to :festival, :dependent => :destroy
	has_many :events
	has_many :shows

	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :allow_destroy => true
	
	extend FriendlyId
	friendly_id :name, use: :slugged

	def slug_candidates
    [
      :name,
      [:name, :id]
    ]
   end
end
