class EventsController < ApplicationController
  
  prepend_view_path Template.resolver
  
  def index
  	@festival = Festival.friendly.find(festival.id)
  	@events = Event.where(:festival_id => festival.id).order(starts_on: :asc)
  end

  def show
  	@event = Event.friendly.find(params[:id])
  end
end
