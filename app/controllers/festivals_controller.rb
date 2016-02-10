class FestivalsController < ApplicationController
  def show
  	@festival = Festival.friendly.find(params[:id])
  	@events = Event.where(:festival_id => @festival.id).order(starts_on: :asc)
  	@artists = Artist.where(:festival_id => @festival.id)
  	@news = News.where(:festival_id => @festival.id)
  	@sponsors = Sponsor.where(:festival_id => @festival.id)
  	@videos = Video.where(:festival_id => @festival.id, :featured => 'Yes')
  	@venues = Venue.where(:festival_id => @festival.id)
  	@theme = FestivalTheme.where(:festival_id => @festival.id)
  end
end
