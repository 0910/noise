class Artists::IndexPresenter < ApplicationPresenter

	presents :festival

	def events
		@festival.events.order(starts_on: :asc)
	end

	def page_title
		content_for :title, @festival.name + ' - Artists'
	end
	
end