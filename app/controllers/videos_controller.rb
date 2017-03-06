class VideosController < ApplicationController
  
  prepend_view_path Template.resolver

  def index
  	@festival = Festival.friendly.find(festival.id)
  	@videos = Video.where(:festival_id => festival.id).order(name: :asc)
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
    render "festivals/#{@festival.slug}/videos/index", :layout => @festival.slug
  end

end
