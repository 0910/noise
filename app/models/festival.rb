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
  
  has_many :festival_themes, :dependent => :destroy
  has_many :themes, :through => :festival_themes

  extend FriendlyId
	friendly_id :name, use: :slugged

	def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end
end
