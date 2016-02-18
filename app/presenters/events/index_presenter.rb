class Events::IndexPresenter < ApplicationPresenter

  presents :festival

  def events
    @festival.events
  end
  
  def page_title
    content_for :title, @festival.name + ' - Events'
  end

end