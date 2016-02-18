class Festival < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :artists
  has_many :events
  has_many :venues
  has_many :shows
  has_many :news
  has_many :sponsors
  has_many :videos
  has_many :templates

  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

  has_attached_file :logo, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>' },
            :url  => "/assets/logos/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/logos/:id/:style/:basename.:extension"
            
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  has_attached_file :image, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>' },
            :url  => "/assets/festivals/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/festivals/:id/:style/:basename.:extension"

  has_attached_file :css_file, :url => "/assets/styles/:id/:basename.:extension", :path => ":rails_root/public/assets/styles/:id/:basename.:extension"
 
  validates_attachment :css_file, :content_type => { :content_type => "text/css" }
   
  extend FriendlyId
	friendly_id :name, use: :slugged

	def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end
end
