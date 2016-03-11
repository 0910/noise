class News < ActiveRecord::Base
	belongs_to :festival

  active_admin_translates :title, :subtitle, :body

  has_attached_file :image, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>' },
            :url  => "/assets/news/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/news/:id/:style/:basename.:extension"
            
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

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
