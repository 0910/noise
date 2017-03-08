class ContactsController < ApplicationController
  def new
  	@festival = Festival.friendly.find(festival.id)
    @contact = Contact.new
    render "festivals/#{@festival.slug}/contacts/new", :layout => @festival.slug
  end

  def create
  	@festival = Festival.friendly.find(festival.id)
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver!
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
    end
    render "festivals/#{@festival.slug}/contacts/new", :layout => @festival.slug
  end
end
