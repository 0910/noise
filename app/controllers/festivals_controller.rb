class FestivalsController < ApplicationController
  
  def festival_id
  	params[:id]
  end

  def show
  	@festival = Festival.find_by_url(request.domain(10).gsub(/^www./,""))
    @videos = Video.where(featured: 'yes')

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
    render "festivals/#{@festival.slug}/festival/show", :layout => @festival.slug

  end

  def lookup
    if festival = Festival.find_by_url(request.domain(10).gsub(/^www./,""))
      params[:id] = festival.id
      show
      render action: :show
    else
      render text: 'this is my landing wohoo'
    end
  end
end
