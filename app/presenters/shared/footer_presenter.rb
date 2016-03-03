class Shared::FooterPresenter < ApplicationPresenter
	
	def name
		festival.name
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
		festival.facebook
	end

	def twitter
		festival.twitter
	end

	def instagram
		festival.instagram
	end

	def soundcloud
		festival.soundcloud
	end

	def lang_english
		link_to 'English', change_locale_path(:en)
	end

	def lang_spanish
		link_to 'Español', change_locale_path(:es)
	end

	def lang_catalan
		link_to 'Català', change_locale_path(:ca)
	end

	def noise
		link_to 'NOISE', 'http://www.wemakenoise.tv', target: '_blank', class: 'noise-link'
	end

end
