class VideosController < ApplicationController
  
  prepend_view_path Template.resolver

  def index
  	@festival = Festival.friendly.find(festival.id)
  	@videos = Video.where(:festival_id => festival.id).order(name: :asc)
  end

end
