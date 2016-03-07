class Events::EventPresenter < Curly::Presenter

  presents :festival, :event

  def name
    @event.name
  end

  def date
    @event.starts_on.to_date.to_formatted_s(:long)
  end

  def slug
    @event.slug
  end

  def image
    @event.image.url(:large)
  end

  def detail_link
    event_path(@event)
  end

  def artists
    @event.artists
  end

end