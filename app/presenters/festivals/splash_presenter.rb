class Festivals::SplashPresenter < Curly::Presenter

  presents :festival, :splash

  def splash_title
    @splash.title
  end

  def splash_subtitle
    simple_format(@splash.subtitle)
  end

  def splash_call_to_action
    @splash.call_to_action
  end

  def call_to_action_link
    @splash.call_to_action_link
  end

  def image
    @splash.photo.url(:high)
  end

end