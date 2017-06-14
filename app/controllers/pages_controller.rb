class PagesController < ApplicationController

  def show
  	@festival = Festival.friendly.find(festival.id)
  	@page = Page.friendly.find(params[:id])

  	set_meta_tags(
      title: @page.name,
      description: @page.body,
      keywords: @festival.keywords,
      og: {
        title: @page.name,
        type:'website',
        url: @festival.url,
        description: @page.body
      }
    )
    render "festivals/#{@festival.slug}/pages/show", :layout => @festival.slug
  end
end
