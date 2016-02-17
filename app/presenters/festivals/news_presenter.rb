class Festivals::NewsPresenter < Curly::Presenter

  presents :festival, :news

  def title
    @news.title
  end

  def subtitle
    @news.subtitle
  end

  def body
    @news.body
  end

  def date
    @news.starts_on.to_date.to_formatted_s(:long)
  end

  def slug
    @news.slug
  end

  def image
    @news.image.url(:large)
  end

  def detail_link
    festival_news_path(festival,@news)
  end

end