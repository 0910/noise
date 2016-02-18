class Artists::ShowPresenter < ApplicationPresenter

	presents :artist, :festival

	def name
		@artist.name
	end

	def bio
		@artist.bio
	end

	def image
		@artist.image.url(:large)
	end

	def facebook
		@artist.facebook_link
	end

	def instagram
		@artist.instagram_link
	end

	def twitter
		@artist.twitter_link
	end

	def soundcloud
		@artist.soundcloud_link
	end

	def page_title
		content_for :title, @festival.name + ' - ' + @artist.name
	end

end