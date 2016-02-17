class NewsController < ApplicationController
  
  prepend_view_path Template.resolver
  
  def index
  	@festival = Festival.friendly.find(festival.id)
  	@news = News.where(:festival_id => @festival.id)
  end

  def show
  	@news = News.friendly.find(params[:id])
  end
end
