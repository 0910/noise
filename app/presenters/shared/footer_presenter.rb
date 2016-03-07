class Shared::FooterPresenter < ApplicationPresenter
	
	def name
		festival.name
	end

	def go_to_home
		root_path
	end

	def go_to_artists
		artists_path(festival)
	end

	def go_to_events
		events_path(festival)
	end

	def go_to_news
		news_index_path(festival)
	end

	def go_to_videos
		videos_path(festival)
	end

	def go_to_venues
		venues_path(festival)
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

	def ra_link
		festival.ra_link
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
