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
  end
end
