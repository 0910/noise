class Events::ShowPresenter < ApplicationPresenter

	presents :event

	def name
		@event.name
	end

	def description
		@event.description
	end

	def venue
		@event.venue.name
	end

	def date
		@event.starts_on.to_date.to_formatted_s(:long)
	end

	def image
		@event.image.url(:large)
	end	

	def tickets
		@event.tickets_link
	end		

	def artists
		@event.artists
	end

end