class Shared::NavigationPresenter < ApplicationPresenter

	def name
		festival.name
	end

	def logo
		festival.logo.url(:large)
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

	def go_to_sponsors
		festival_sponsors_path(festival)
	end

	def go_to_contact
		new_festival_contact_path(festival)
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

	def lang_english_short
		link_to 'En', change_locale_path(:en)
	end

	def lang_spanish_short
		link_to 'Es', change_locale_path(:es)
	end

	def lang_catalan_short
		link_to 'Ca', change_locale_path(:ca)
	end

end
