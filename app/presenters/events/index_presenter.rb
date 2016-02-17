class Events::IndexPresenter < ApplicationPresenter

  presents :festival

  def events
    @festival.events
  end
  
end