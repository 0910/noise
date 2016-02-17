class Artists::IndexPresenter < ApplicationPresenter

	presents :festival

	def artists
		@festival.artists
	end

	def events
		@festival.events
	end
	
end