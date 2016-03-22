class Shared::NavigationPresenter < ApplicationPresenter

	def name
		festival.name
	end

	def logo
		festival.logo.url(:large)
	end

	def go_to_home
		params[:locale]
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
		link_to 'English', '/en'
	end

	def lang_spanish
		link_to 'Español', '/es'
	end

	def lang_catalan
		link_to 'Català', '/ca'
	end

	def lang_english_short
		link_to 'En', '/en'
	end

	def lang_spanish_short
		link_to 'Es', '/es'
	end

	def lang_catalan_short
		link_to 'Ca', '/ca'
	end

end
