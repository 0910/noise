class ArtistsController < ApplicationController
  
  #prepend_view_path CustomTemplateResolver.new

  def show
  	@artist = Artist.friendly.find(params[:id])
  	#render :file => "/public/assets/templates/1/original/artists_show"
  end

  protected

  # This is the tricky part - in order to get data into your
  # template resolver, you need to register a template detail.
  # This needs to be an array. The block returns a default value.
  #ActionView::LookupContext.register_detail(:templates) { [] }

  # This is called by Rails to get the actual details:
  #def details_for_lookup
    # You could also use e.g. `themes`.
    #{ templates: [current_festival] }
  #end

end
