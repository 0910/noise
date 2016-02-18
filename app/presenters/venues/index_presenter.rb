class Venues::IndexPresenter < ApplicationPresenter

	presents :festival

	def venues
		@festival.venues
	end

	def page_title
	  content_for :title, @festival.name + ' - Venues'
	end

end