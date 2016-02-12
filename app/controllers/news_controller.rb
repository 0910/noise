class NewsController < ApplicationController
  def show
  	@news = News.friendly.find(params[:id])
  end
end
