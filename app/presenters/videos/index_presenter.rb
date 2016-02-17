class Videos::IndexPresenter < ApplicationPresenter

  presents :festival

  def videos
    @festival.videos
  end
  
end