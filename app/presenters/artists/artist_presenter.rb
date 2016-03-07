class Artists::ArtistPresenter < Curly::Presenter

  presents :festival, :artist

  def name
    @artist.name
  end

  def bio
    @artist.bio.html_safe
  end

  def cover
    @artist.image.url(:large)
  end

  def artist_detail_link
    artist_path(@artist)
  end

end