class ArtistsController < ApplicationController
  def index
  	@artists = Artist.where(:festival_id => current_festival.id)
  end

  def show
  	@artist = Artist.friendly.find(params[:id])
  end
end
