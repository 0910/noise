class VenuesController < ApplicationController
	
  prepend_view_path Template.resolver
  
  def show
  	@venue = Venue.friendly.find(params[:id])
  end
end
