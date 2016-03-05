class Festivals::ShowPresenter < ApplicationPresenter

	presents :festival

	def name
		@festival.name
	end

	def events
		@festival.events.order(starts_on: :asc)
	end

	def news
		@festival.news
	end

	def videos
		@festival.videos
	end

	def venues
		@festival.venues
	end

	def sponsors
		@festival.sponsors
	end

	def go_to_home
		festival_path(festival)
	end

	def go_to_artists
		festival_artists_path(festival)
	end

	def go_to_events
		festival_events_path(festival)
	end

	def go_to_news
		festival_news_index_path(festival)
	end

	def go_to_videos
		festival_videos_path(festival)
	end

	def go_to_venues
		festival_venues_path(festival)
	end

	def facebook
		@festival.facebook
	end

	def twitter
		@festival.twitter
	end

	def instagram
		@festival.instagram
	end

	def soundcloud
		@festival.soundcloud
	end

	def noise
		link_to 'NOISE', 'http://www.wemakenoise.tv', target: '_blank'
	end

	def page_title
		content_for :title, @festival.name
	end

	def get_tickets
		festival_events_path(festival)
	end

end