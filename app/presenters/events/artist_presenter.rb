class Events::ArtistPresenter < Curly::Presenter

  presents :event, :artist

  def name
    @artist.artist.name
  end

  def bio
    SafeMarkdown.render(@artist.artist.bio)
  end

  def image
    @artist.artist.image.url(:large)
  end

  def artist_detail_link
    artist_path(@artist.artist)
  end

end