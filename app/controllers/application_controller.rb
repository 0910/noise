class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def artist
    Artist.find(artist_id)
  end
  helper_method :artist
  def artist_id
  	params[:artist_id]
  end
end
