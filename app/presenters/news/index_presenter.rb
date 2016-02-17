class News::IndexPresenter < ApplicationPresenter

	presents :festival

	def news
		@festival.news
	end

end