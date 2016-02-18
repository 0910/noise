class News::IndexPresenter < ApplicationPresenter

	presents :festival

	def news
		@festival.news
	end

	def page_title
      content_for :title, @festival.name + ' - News'
    end

end