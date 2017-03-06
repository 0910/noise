class VenuesController < ApplicationController
	
  prepend_view_path Template.resolver
  
  def index
  	@festival = Festival.friendly.find(festival.id)
  	@venues = Venue.where(:festival_id => festival.id).order(name: :asc)

  	set_meta_tags title: @festival.name, description: @festival.description, keywords: @festival.keywords, og: { title: @festival.name, type:'website', url: @festival.url, image: @festival.image.url(:large), description: @festival.description }

  end

  def show
  	@festival = Festival.friendly.find(festival.id)
  	@venue = Venue.friendly.find(params[:id])

  	set_meta_tags(
      title: @venue.name,
      description: @venue.description,
      keywords: @festival.keywords,
      og: {
        title: @venue.name,
        type:'website',
        url: @festival.url,
        image: @venue.image.url(:large),
        description: @venue.description
      }
    )
    render "festivals/#{@festival.slug}/venues/show", :layout => @festival.slug
  end
end
