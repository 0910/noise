class EventsController < ApplicationController
  def index
  	@events = Event.where(:festival_id => current_festival.id)
  	render :json => @events
  end

  def show
  	@event = Event.friendly.find(params[:id])
  	render :json => @event
  end
end
