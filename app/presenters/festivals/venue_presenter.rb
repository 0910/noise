class Festivals::VenuePresenter < Curly::Presenter

  presents :festival, :venue

  def name
    @venue.name
  end

  def location
    @venue.location
  end

  def description
    @venue.description
  end

  def capacity
    @venue.capacity
  end

  def slug
    @venue.slug
  end

  def image
    @venue.image.url(:large)
  end

  def detail_link
    venue_path(@venue)
  end

end