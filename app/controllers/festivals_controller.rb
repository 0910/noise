class FestivalsController < ApplicationController
  
  prepend_view_path Template.resolver
  
  def festival_id
  	params[:id]
  end

  def show
  	@festival = Festival.find_by_url(request.domain(10).gsub(/^www./,""))

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
