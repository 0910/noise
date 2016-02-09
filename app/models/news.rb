class News < ActiveRecord::Base
	belongs_to :festival, :dependent => :destroy

	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :allow_destroy => true

	extend FriendlyId
	friendly_id :title, use: :slugged

	def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end
