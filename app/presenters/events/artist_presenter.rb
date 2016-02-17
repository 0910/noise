class Events::ArtistPresenter < Curly::Presenter

  presents :event, :artist

  def name
    @artist.name
  end

  def bio
    SafeMarkdown.render(@artist.bio)
  end

  def image
    @artist.image.url(:large)
  end

  def artist_detail_link
    festival_artist_path(festival,@artist)
  end

end