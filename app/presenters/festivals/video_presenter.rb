class Festivals::VideoPresenter < Curly::Presenter

  presents :festival, :video

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

  def video_detail_link
    festival_video_path(festival,@video)
  end

end