class News::ShowPresenter < ApplicationPresenter

	presents :news, :festival

	def title
		@news.title
	end

	def subtitle
		@news.subtitle
	end

	def body
		simple_format(@news.body)
	end

	def date
		@news.starts_on.to_date.to_formatted_s(:long)
	end

	def image
		@news.image.url(:large)
	end	

	def page_title
		content_for :title, @festival.name + ' - ' + @news.title
	end

end