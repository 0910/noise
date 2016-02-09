class Show < ActiveRecord::Base
  belongs_to :festival
  belongs_to :event
  belongs_to :venue

  belongs_to :artist

  extend FriendlyId
	friendly_id :name, use: :slugged

	def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end
end
