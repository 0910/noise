class Stage < ActiveRecord::Base
  belongs_to :day
  belongs_to :festival
  has_many :presentations
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
