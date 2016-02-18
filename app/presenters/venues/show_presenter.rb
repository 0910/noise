class Venues::ShowPresenter < ApplicationPresenter

	presents :venue, :festival

	def name
		@venue.name
	end

	def location
		@venue.location
	end

	def description
		simple_format(@venue.description)
	end

	def capacity
		@venue.capacity
	end

	def image
		@venue.image.url(:large)
	end

	def page_title
		content_for :title, @festival.name + ' - ' + @venue.name
	end

end