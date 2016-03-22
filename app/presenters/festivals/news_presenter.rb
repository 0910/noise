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
    @news.date.to_date.to_formatted_s(:long)
  end

  def slug
    @news.slug
  end

  def image
    @news.image.url(:large)
  end

  def images
    @news.images
  end

  class ImagePresenter < ApplicationPresenter
    presents :news, :image

    def source
      @image.file.url(:large)
    end
  end

  def cover
    @news.images.where(:cover => true)
  end

  class CoverPresenter < ApplicationPresenter
    presents :news, :cover

    def source
      @cover.file.url(:large)
    end
  end

  def detail_link
    news_path(@news, :locale => I18n.locale)
  end

  def video
    @news.video
  end

end