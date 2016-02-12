class News < ActiveRecord::Base
	belongs_to :festival, :dependent => :destroy

	has_attached_file :image, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>' },
            :url  => "/assets/news/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/news/:id/:style/:basename.:extension"
            
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	extend FriendlyId
	friendly_id :title, use: :slugged

	def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end
