class Festivals::ArtistPresenter < Curly::Presenter

  presents :festival, :artist

  def name
    @artist.artist.name
  end

  def bio
    @artist.artist.bio.html_safe
  end

  def cover
    @artist.artist.image.url(:large)
  end

  def artist_detail_link
    artist_path(@artist.artist, :locale => I18n.locale)
  end

end