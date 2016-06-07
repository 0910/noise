class Festivals::ShowPresenter < ApplicationPresenter

	presents :festival

	def name
		@festival.name
	end

	def days
		@festival.days.order(date: :asc)
	end

	def events
		@festival.events.order(starts_on: :asc)
	end

	def news
		@festival.news.order(date: :desc).first(6)
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

	def splashes
		@festival.splashes
	end

	def go_to_home
	end

	def go_to_artists
		artists_path
	end

	def go_to_events
		events_path
	end

	def go_to_news
		news_index_path
	end

	def go_to_videos
		videos_path
	end

	def go_to_venues
		venues_path
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

	def ra
		@festival.ra_link
	end

	def noise
		link_to 'NOISE', 'http://www.wemakenoise.tv', target: '_blank'
	end

	def page_title
		content_for :title, @festival.name
	end

	def get_tickets
		events_path
	end

end