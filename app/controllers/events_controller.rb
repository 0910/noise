class EventsController < ApplicationController
  
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
  	@event = Event.friendly.find(params[:id])

  	set_meta_tags(
      title: @event.name, 
      description: @event.description, 
      keywords: @festival.keywords, 
      og: { 
        title: @event.name, 
        type:'website', 
        url: @festival.url, 
        image: @event.image.url(:large), 
        description: @event.description 
      }
    )

  end
end
