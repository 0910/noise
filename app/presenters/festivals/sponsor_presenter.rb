class Festivals::SponsorPresenter < Curly::Presenter

  presents :festival, :sponsor

  def name
    @sponsor.name
  end

  def image
    @sponsor.image.url(:large)
  end

  def sponsor_link
    @sponsor.link
  end

end