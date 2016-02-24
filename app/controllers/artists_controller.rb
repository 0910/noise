class ArtistsController < ApplicationController
  
  prepend_view_path Template.resolver

  def index
  	@festival = Festival.friendly.find(festival.id)

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

  end

end
