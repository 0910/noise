class Festivals::EventPresenter < Curly::Presenter

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
    festival_event_path(festival,@event)
  end

  def artists
    @event.artists.order('name desc')
  end

end