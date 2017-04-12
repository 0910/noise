class PressContactsController < ApplicationController
  def new
  	@festival = Festival.friendly.find(festival.id)
    @press_contact = PressContact.new
    render "festivals/#{@festival.slug}/press_contacts/new", :layout => @festival.slug
  end

  def create
  	@festival = Festival.friendly.find(festival.id)
    @press_contact = PressContact.new(params[:contact])
    @press_contact.request = request
    if @press_contact.deliver!
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
    end
    render "festivals/#{@festival.slug}/press_contacts/new", :layout => @festival.slug
  end
end
