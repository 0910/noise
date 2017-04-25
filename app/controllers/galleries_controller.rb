class GalleriesController < ApplicationController
  def index
  	@festival = Festival.friendly.find(festival.id)
  	@galleries = @festival.galleries.all.order(title: :desc)

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
    render "festivals/#{@festival.slug}/galleries/index", :layout => @festival.slug
  end

  def show
  	@festival = Festival.friendly.find(festival.id)
  	@gallery = Gallery.friendly.find(params[:id])

  	set_meta_tags(
      title: @gallery.title,
      description: @gallery.title,
      keywords: @festival.keywords,
      og: {
        title: @gallery.title,
        type:'website',
        url: @festival.url,
        image: @festival.image.url(:large),
        description: @gallery.title 
      }
    )
    render "festivals/#{@festival.slug}/galleries/show", :layout => @festival.slug
  end
end
