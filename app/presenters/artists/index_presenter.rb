class Artists::IndexPresenter < ApplicationPresenter

	presents :festival

	def artists
		@festival.artists
	end

	def events
		@festival.events
	end

	def page_title
		content_for :title, @festival.name + ' - Artists'
	end
	
end