class Shared::NavigationPresenter < ApplicationPresenter

	def name
		festival.name
	end

	def logo
		festival.logo.url(:large)
	end

	def go_to_home
		root_path
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

	def go_to_sponsors
		sponsors_path
	end

	def go_to_contact
		new_contact_path
	end

	def menu_title_home
		festival.menu_title_home
	end

	def menu_title_artists
		festival.menu_title_artists
	end

	def menu_title_events
		festival.menu_title_events
	end

	def menu_title_news
		festival.menu_title_news
	end

	def menu_title_videos
		festival.menu_title_videos
	end

	def menu_title_venues
		festival.menu_title_venues
	end

	def menu_title_contacts
		festival.menu_title_contacts
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
