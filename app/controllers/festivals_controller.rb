class FestivalsController < ApplicationController

  prepend_view_path Template.resolver
  
  def festival_id
  	params[:id]
  end

  def show
  	@festival = Festival.friendly.find(params[:id])
  	@events = Event.where(:festival_id => @festival.id).order(starts_on: :asc)
  	@artists = Artist.where(:festival_id => @festival.id).order(name: :asc)
  	@news = News.where(:festival_id => @festival.id)
  	@sponsors = Sponsor.where(:festival_id => @festival.id)
  	@videos = Video.where(:festival_id => @festival.id)
  	@venues = Venue.where(:festival_id => @festival.id)

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
    if festival = Festival.find_by_url(request.domain(10))
      params[:id] = festival.id
      show
      render action: :show
    else
      render text: 'this is my landing wohoo'
    end
  end
end
