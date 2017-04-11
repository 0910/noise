class FestivalsController < ApplicationController
  
  def festival_id
  	params[:id]
  end

  def show
  	@festival = Festival.find_by_url(request.domain(10).gsub(/^www./,""))
    @videos = @festival.videos.where(featured: 'yes')
    @news = @festival.news.all.order(date: :desc)

    set_meta_tags(
      title: @festival.name,
      description: @festival.description,
      keywords: @festival.keywords,
      og: {
        title: @festival.name,
        type:'website',
        url: @festival.url,
        image: @festival.image.url(:large),
        description: @festival.description
      }
    )
    if @festival.published?
      render "festivals/#{@festival.slug}/festival/show", :layout => @festival.slug
    else
      render "festivals/#{@festival.slug}/festival/soon"
    end
  end

  def lookup
    if festival = Festival.find_by_url(request.domain(10).gsub(/^www./,"")) || Festival.find(1)
      params[:id] = festival.id
      show
    else
      render text: 'this is my landing wohoo'
    end
  end
end
