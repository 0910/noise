class Festivals::SplashPresenter < Curly::Presenter

  presents :festival, :splash

  def title
    @splash.title
  end

  def subtitle
    simple_format(@splash.subtitle)
  end

  def call_to_action
    @splash.call_to_action
  end

  def call_to_action_link
    @splash.call_to_action_link
  end

  def image
    @splash.photo.url(:large)
  end

end