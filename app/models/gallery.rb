class Gallery < ActiveRecord::Base
  belongs_to :festival
	has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

	extend FriendlyId
  friendly_id :slug_candidates, use: :history

  def slug_candidates
    [
        [:id, :title]
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
