class Theme < ActiveRecord::Base
  belongs_to :festival

  has_attached_file :home_photo, :styles => { :thumb => "120x80>", :high => "1920x1280>" }, default_url: "/images/:style/missing.png"
  has_attached_file :intro_photo, :styles => { :thumb => "120x80>", :high => "1920x1280>" }, default_url: "/images/:style/missing.png"
  has_attached_file :artists_photo, :styles => { :thumb => "120x80>", :high => "1920x1280>" }, default_url: "/images/:style/missing.png"
  has_attached_file :events_photo, :styles => { :thumb => "120x80>", :high => "1920x1280>" }, default_url: "/images/:style/missing.png"
  has_attached_file :news_photo, :styles => { :thumb => "120x80>", :high => "1920x1280>" }, default_url: "/images/:style/missing.png"
  has_attached_file :shows_photo, :styles => { :thumb => "120x80>", :high => "1920x1280>" }, default_url: "/images/:style/missing.png"
  has_attached_file :venues_photo, :styles => { :thumb => "120x80>", :high => "1920x1280>" }, default_url: "/images/:style/missing.png"
  has_attached_file :videos_photo, :styles => { :thumb => "120x80>", :high => "1920x1280>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :home_photo, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :intro_photo, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :artists_photo, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :events_photo, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :news_photo, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :shows_photo, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :venues_photo, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :videos_photo, content_type: /\Aimage\/.*\Z/

  extend FriendlyId
	friendly_id :name, use: :slugged

	def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end
end
