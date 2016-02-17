class ArtistsController < ApplicationController
  
  prepend_view_path Template.resolver

  def index
  	@festival = Festival.friendly.find(festival.id)
  	@artists = Artist.where(:festival_id => festival.id).order(name: :asc)
  	@events = Event.where(:festival_id => festival.id).order(starts_on: :asc)
  end

  def show
  	@artist = Artist.friendly.find(params[:id])
  end

end
