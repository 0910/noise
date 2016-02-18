class NewsController < ApplicationController
  
  prepend_view_path Template.resolver
  
  def index
  	@festival = Festival.friendly.find(festival.id)
  	@news = News.where(:festival_id => @festival.id)

  	set_meta_tags title: @festival.name, description: @festival.description, keywords: @festival.keywords, og: { title: @festival.name, type:'website', url: @festival.url, image: @festival.image.url(:large), description: @festival.description }

  end

  def show
  	@festival = Festival.friendly.find(festival.id)
  	@news = News.friendly.find(params[:id])

  	set_meta_tags title: @news.title, description: @news.subtitle, keywords: @festival.keywords, og: { title: @news.title, type:'website', url: @festival.url, image: @news.image.url(:large), description: @news.subtitle }

  end
end
