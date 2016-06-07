class Festivals::PresentationPresenter < Curly::Presenter

  presents :festival, :presentation

  def name
    @presentation.name
  end

  def artist
    @presentation.artist.name
  end

  def time
    @presentation.time.strftime("%k:%M")
  end

  def duration
    @presentation.duration
  end

  def artist_detail_link
    artist_path(@presentation.artist, :locale => I18n.locale)
  end

end