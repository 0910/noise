class ArtistsController < ApplicationController
  
  def index
  	@festival = Festival.friendly.find(festival.id)
  	@artists = Artist.where(:festival_id => @festival.id)

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
    render "festivals/#{@festival.slug}/artists/index", :layout => @festival.slug

  end

  def show
  	@festival = Festival.friendly.find(festival.id)
  	@artist = Artist.friendly.find(params[:id])

  	set_meta_tags(
      title: @artist.name,
      description: @artist.bio,
      keywords: @festival.keywords,
      og: { 
        title: @artist.name, 
        type:'website', 
        url: @festival.url, 
        image: @artist.image.url(:large), 
        description: @artist.bio 
      }
    )
    render "festivals/#{@festival.slug}/artists/show", :layout => @festival.slug
  end

end
