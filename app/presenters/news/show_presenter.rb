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
		@news.date.to_date.to_formatted_s(:long)
	end

	def image
		@news.image.url(:large)
	end	

	def images
		@news.images
	end

	class ImagePresenter < ApplicationPresenter
		presents :news, :image

		def source
	 		@image.file.url(:large)
		end
	end

	def cover
		@news.images.where(:cover => true)
	end

	class CoverPresenter < ApplicationPresenter
		presents :news, :cover

		def source
	 		@cover.file.url(:large)
		end
	end

	def video
	    @news.video
	end

	def page_title
		content_for :title, @festival.name + ' - ' + @news.title
	end

end