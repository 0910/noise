class Videos::VideoPresenter < Curly::Presenter

  presents :video

  def name
    @video.name
  end

  def description
    SafeMarkdown.render(@video.description)
  end

  def cover
    @video.image.url(:large)
  end

  def youtube_link
    @video.link
  end

  def app_link
    festival_artist_path(festival,video)
  end

end