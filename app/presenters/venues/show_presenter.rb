class Venues::ShowPresenter < ApplicationPresenter

	presents :venue

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

end