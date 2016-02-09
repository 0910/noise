class GalleriesController < ApplicationController
  def index
  	@galleries = Gallery.all.reverse_order
  end
  def show
  	@galleries = Gallery.all.reverse_order
  	@gallery = Gallery.find(params[:id])
  end
end
