class Videos::IndexPresenter < ApplicationPresenter

  presents :festival

  def videos
    @festival.videos
  end

  def page_title
	  content_for :title, @festival.name + ' - Videos'
	end
  
end