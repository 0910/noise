class Festivals::EventPresenter < Curly::Presenter

  presents :festival, :event

  def name
    @event.name
  end

  def date
    @event.starts_on.to_date.to_formatted_s(:long)
  end

  def short_date
    @event.starts_on.to_date.to_formatted_s(:short)
  end

  def slug
    @event.slug
  end

  def image
    @event.image.url(:large)
  end

  def detail_link
    event_path(@event, :locale => I18n.locale)
  end

  def artists_asc
    @event.artists.order(name: :asc)
  end

  def artists_desc
    @event.artists.order(name: :desc)
  end

  def artists
    @event.event_artists.order(position: :asc)
  end

  def presentations
    @event.presentations.order(starts_on: :asc)
  end

  def tickets
    @event.tickets_link
  end

end